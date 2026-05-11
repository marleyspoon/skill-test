# Run using bin/ci

CI.run do
  step "Setup", "bin/setup --skip-server"

  step "Postgres (Docker Compose)", "docker compose up --wait -d postgres"

  db_env = "DATABASE_HOST=127.0.0.1 DATABASE_PORT=5433 DATABASE_USER=skill_test DATABASE_PASSWORD=skill_test"
  step "Database (test)", "#{db_env} bin/rails db:test:prepare"

  step "Tests: RSpec", "#{db_env} bin/rspec"

  # Optional: Run system tests
  # step "Tests: System", "bin/rails test:system"

  # Optional: set a green GitHub commit status to unblock PR merge.
  # Requires the `gh` CLI and `gh extension install basecamp/gh-signoff`.
  # if success?
  #   step "Signoff: All systems go. Ready for merge and deploy.", "gh signoff"
  # else
  #   failure "Signoff: CI failed. Do not merge or deploy.", "Fix the issues and try again."
  # end
end
