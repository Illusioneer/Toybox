var lister = ["Ray", "Lucy", "Bob", "Thom", "David", "Aster", "Charles", "Eddy", "Frank", "Hank", "John"];
for (var i in lister){
  entry = {name: lister[i], created: Date(),note: "Hi I'm a new user."}
  db.names.insert(entry);
}
