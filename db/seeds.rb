# seed data for recipes and ingredients
recipes_list = JSON.parse(File.read("recipes-en.json"))

recipes_list.each do |recipe|
    item = Recipe.new(title: recipe["title"], cook_time: recipe["cook_time"], prep_time: recipe["prep_time"], ratings: recipe["ratings"], cuisine: recipe["cuisine"], category: recipe["category"], author: recipe["author"], image: recipe["image"])
    recipe["ingredients"].map{ |ingredient| item.ingredients.build(name: ingredient) }
    item.save!
end