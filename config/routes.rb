Comcafe::Application.routes.draw do
  resources :posts, path: "/", path_names: { new: "novo", edit: "editar" }
end
