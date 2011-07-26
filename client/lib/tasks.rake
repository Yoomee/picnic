require "sqlite3"
namespace :picnic do
  task :sqlite => :environment do
    #create/open database
    db = SQLite3::Database.new( "Picnic.sqlite" )

    #drop tables
    db.execute2("DROP TABLE Z_METADATA")
    db.execute2("DROP TABLE Z_PRIMARYKEY")
    db.execute2("DROP TABLE ZVENUE")
    db.execute2("DROP TABLE ZCONFERENCESESSION")

    #Set up tables
    db.execute2("CREATE TABLE Z_METADATA (Z_VERSION INTEGER PRIMARY KEY, Z_UUID VARCHAR(255), Z_PLIST BLOB)")
    db.execute2("CREATE TABLE Z_PRIMARYKEY (Z_ENT INTEGER PRIMARY KEY, Z_NAME VARCHAR, Z_SUPER INTEGER, Z_MAX INTEGER)")
    db.execute2("CREATE TABLE ZVENUE (Z_PK INTEGER PRIMARY KEY ,Z_ENT INTEGER,Z_OPT INTEGER,ZNAME VARCHAR, ZORDER INTEGER DEFAULT 0)")
    db.execute2("CREATE TABLE ZCONFERENCESESSION ( Z_PK INTEGER PRIMARY KEY, Z_ENT INTEGER, Z_OPT INTEGER, ZVENUE INTEGER, ZSTARTSAT TIMESTAMP, ZTIMESTAMP TIMESTAMP, ZENDSAT TIMESTAMP, ZNAME VARCHAR, ZTEXT VARCHAR, ZCOLORR FLOAT, ZCOLORG FLOAT, ZCOLORB FLOAT, ZDAY INTEGER)")

    #Create Venues
    Venue.all.each_with_index do |venue, idx|
      db.execute2("INSERT INTO ZVENUE VALUES (#{venue.id},2,1,'#{venue}',#{idx})")
    end
    #Create ConferenceSession
    ConferenceSession.all.each_with_index do |session, idx|
      db.execute2("INSERT INTO ZCONFERENCESESSION VALUES (#{session.id},2,1,#{session.venue_id}, '#{timestamp(session.starts_at)}', '#{timestamp(session.created_at)}', '#{timestamp(session.ends_at)}', '#{quote_string(session.name)}', '#{quote_string(session.description)}', #{hex_to_rgb(session.color).join(',')}, #{session.conference_day})")
    end
  end  
end

def quote_string(s)
  s.gsub(/\\/, '\&\&').gsub(/'/, "''")
end

def timestamp(time)
  "%9.5f" % time.to_f
end

def hex_to_rgb(hexcolor)
  hexcolor = hexcolor.sub(/#/,"")
  hexcolor.scan(/../).collect{|str| "%.2f" % (str.hex.to_f/255)}
end