module ActiveRecord
    
  class Migration
    
    def self.puts(message)
      if message.is_a?(Exception)
        msg = []
        msg << "\n\n\n***************************************************\n"
        msg << "** MIGRATION ERROR ********************************\n"
        msg << "***************************************************\n"
        msg << "#{message}\n"
        msg << "***************************************************\n\n\n"
        IO.instance_eval { puts msg.join("") }
        return
      end
      
      IO.instance_eval { puts message }
    end
  end

  module ConnectionAdapters
    module SchemaStatements

      alias :safe_migrations_add_column :add_column
      def add_column(table_name, column_name, type, options = {})
        safe_migrations_add_column(table_name, column_name, type, options)
      rescue
        puts($!)
      end

      alias :safe_migrations_add_index :add_index
      def add_index(table_name, column_name, options = {})
        safe_migrations_add_index(table_name, column_name, options)
      rescue
        puts($!)
      end

      alias :safe_migrations_change_column :change_column
      def safe_migrations_change_column(table_name, column_name, type, options = {})
        safe_migrations_change_column(table_name, column_name, type, options)
      rescue
        puts($!)
      end

      alias :safe_migrations_change_column_default :change_column_default
      def safe_migrations_change_column_default(table_name, column_name, default)
        safe_migrations_change_column_default(table_name, column_name, default)
      rescue
        puts($!)
      end

      alias :safe_migrations_change_table :change_table
      def change_table(table_name, &block)
        safe_migrations_change_table(table_name, &block)
      rescue
        puts($!)
      end

      alias :safe_migrations_create_table :create_table
      def create_table(table_name, options = {}, &block)
        safe_migrations_create_table(table_name, options, &block)
      rescue
        puts($!)
      end

      alias :safe_migrations_drop_table :drop_table
      def create_table(table_name, options = {})
        safe_migrations_drop_table(table_name, options)
      rescue
        puts($!)
      end

      alias :safe_migrations_remove_column :remove_column
      def remove_column(table_name, *column_names)
        safe_migrations_remove_column(table_name, *column_names)
      rescue
        puts($!)
      end

      alias :safe_migrations_remove_index :remove_index
      def remove_index(table_name, options = {})
        safe_migrations_remove_index(table_name, options = {})
      rescue
        puts($!)
      end

      alias :safe_migrations_rename_column :rename_column
      def rename_column(table_name, column_name, new_column_name)
        safe_migrations_rename_column(table_name, column_name, new_column_name)
      rescue
        puts($!)
      end

      alias :safe_migrations_rename_table :rename_table
      def rename_table(table_name, new_name)
        safe_migrations_rename_table(table_name, new_name)
      rescue
        puts($!)
      end
      
    end
  end
  
end