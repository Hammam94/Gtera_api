Rails.application.routes.draw do
  # if Rails.env.development?
  #   mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "graphql#execute"
  # end

  post "/graphql", to: "graphql#execute"
  mount Spree::Core::Engine, at: '/'
end
