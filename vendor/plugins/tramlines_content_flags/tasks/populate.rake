namespace :content_flags do
  namespace :db do
    desc "Fill database with content flag types, content flags and content flag fields."
    task :populate => :environment do
      require 'populator'
      
      ContentFlagType.populate 5 do |content_flag_type|
        content_flag_type.name = Populator.words(2..3).humanize
        content_flag_type.color = "#%06x" % rand(2**24-1)
        ContentFlag.populate 5..10 do |content_flag|
          content_flag.content_flag_type_id = content_flag_type.id
          models = [Status.first(:conditions => ["id >=?",rand(Status.count)]), Member.first(:conditions => ["id >=?",rand(Member.count)])]
          attachable = models[rand(models.size)]
          content_flag.attachable_type = attachable.class.to_s
          content_flag.attachable_id = attachable.id
          content_flag.member_id = Member.first(:conditions => ["id >=?",rand(Member.count)]).id
          content_flag.message = Populator.sentences(2..3).humanize
          ContentFlagField.populate 0..3 do |content_flag_field|
            content_flag_field.content_flag_id = content_flag.id
            content_flag_field.name = attachable.class.filtered_attributes
            content_flag_field.value = attachable.send(content_flag_field.name)
          end
        end
      end

    end
  end

end