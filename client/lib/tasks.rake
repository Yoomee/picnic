require "sqlite3"
namespace :picnic do
  task :sqlite => :environment do
    system("rm Picnic.sqlite")
    #create/open database
    db = SQLite3::Database.new( "Picnic.sqlite" )

    #Set up tables
    db.execute2("CREATE TABLE Z_METADATA (Z_VERSION INTEGER PRIMARY KEY, Z_UUID VARCHAR(255), Z_PLIST BLOB)")
    db.execute2("CREATE TABLE Z_PRIMARYKEY (Z_ENT INTEGER PRIMARY KEY, Z_NAME VARCHAR, Z_SUPER INTEGER, Z_MAX INTEGER)")
    db.execute2("CREATE TABLE ZVENUE (Z_PK INTEGER PRIMARY KEY ,Z_ENT INTEGER,Z_OPT INTEGER,ZNAME VARCHAR, ZORDER INTEGER DEFAULT 0, ZUID INTEGER)")
    db.execute2("CREATE TABLE ZCONFERENCESESSION ( Z_PK INTEGER PRIMARY KEY, Z_ENT INTEGER, Z_OPT INTEGER, ZVENUE INTEGER, ZSTARTSAT TIMESTAMP, ZTIMESTAMP TIMESTAMP, ZENDSAT TIMESTAMP, ZNAME VARCHAR, ZTEXT VARCHAR, ZCOLORR FLOAT, ZCOLORG FLOAT, ZCOLORB FLOAT, ZDAY INTEGER, ZUID INTEGER)")
    db.execute2("CREATE TABLE ZMEMBER ( Z_PK INTEGER PRIMARY KEY, Z_ENT INTEGER, Z_OPT INTEGER, ZFORENAME STRING, ZSURNAME STRING, ZBIO STRING, ZISSPEAKER BOOLEAN, ZUID INTEGER)")
    db.execute2("CREATE TABLE Z_1SPEAKERS ( Z_1SESSIONSSPEAKINGAT INTEGER, Z_2SPEAKERS INTEGER, PRIMARY KEY (Z_1SESSIONSSPEAKINGAT, Z_2SPEAKERS) )")


    #Create Venues
    puts "Exporting venues."
    Venue.all.each do |venue|
      db.execute2("INSERT INTO ZVENUE VALUES (#{venue.id},2,1,'#{quote_string(venue.name)}',#{venue.weight},#{venue.id})")
    end
    #Create ConferenceSessions and Members
    inserted_speakers = []
    puts "Exporting sessions."
    ConferenceSession.all.each_with_index do |session, idx|
      if !session.tags.blank?
        db.execute2("INSERT INTO ZCONFERENCESESSION VALUES (#{session.id},2,1,#{session.venue_id}, '#{timestamp(session.starts_at)}', '#{timestamp(session.created_at)}', '#{timestamp(session.ends_at)}', '#{quote_string(session.name)}', '#{quote_string(session.description)}', #{hex_to_rgb(session.color).join(',')}, #{session.conference_day},#{session.id})")
        session.speakers.each do |speaker|
          if !inserted_speakers.include?(speaker)
            db.execute2("INSERT INTO ZMEMBER VALUES (#{speaker.id},2,1,'#{quote_string(speaker.forename)}', '#{quote_string(speaker.surname)}', '#{quote_string(speaker.bio)}', 1,#{speaker.id})")
            inserted_speakers << speaker
          end
          db.execute2("INSERT INTO Z_1SPEAKERS VALUES (#{session.id}, #{speaker.id})")
        end
      end
    end

  end  
end

def quote_string(s)
  return '' if s.blank?
  s.strip_tags.gsub(/\\/, '\&\&').gsub(/'/, "''")
end

def timestamp(time)
  "%9.5f" % time.to_f
end

def hex_to_rgb(hexcolor)
  hexcolor = hexcolor.sub(/#/,"")
  hexcolor.scan(/../).collect{|str| "%.2f" % (str.hex.to_f/255)}
end