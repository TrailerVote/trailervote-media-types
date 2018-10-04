# frozen_string_literal: true

warning = "You're executing rake from the project root. Move into /ruby."
warn warning
task :noop do
  raise warning
end
task default: :noop
