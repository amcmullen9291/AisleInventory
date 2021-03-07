Aisle.create!([
  {aisle_number: "1"},
  {aisle_number: "2"},
  {aisle_number: "3"},
  {aisle_number: "4"},
  {aisle_number: "5"},
  {aisle_number: "6"},
  {aisle_number: "7"}
])
Card.create!([
  {description: "test", in_stock: 6500, sku: "2681898131991|JZLZWQLN", manufacturer_id: "1", aisle_id: 2, occasion_id: 1},
  {description: "dogs", in_stock: 1200, sku: "8314174367671|68UY95HE", manufacturer_id: "5", aisle_id: 3, occasion_id: 10},
  {description: "poochies", in_stock: 750, sku: "5950737899031|DDWWNGFC", manufacturer_id: "2", aisle_id: 5, occasion_id: 1},
  {description: "ITS WORKING NOW", in_stock: 958, sku: "2231090505931|36295390", manufacturer_id: "3", aisle_id: 4, occasion_id: 10},
  {description: "test for search", in_stock: 2000, sku: "7426087503693|SJBTSTJX", manufacturer_id: "3", aisle_id: 4, occasion_id: 10},
  {description: "seed data", in_stock: 750, sku: "3111398392374|37DN95GN", manufacturer_id: "3", aisle_id: 5, occasion_id: 1},
  {description: "more test data", in_stock: 2500, sku: "5251685124924|47885009", manufacturer_id: "4", aisle_id: 6, occasion_id: 14},
  {description: "puppy card", in_stock: 2500, sku: "1726041114450|NG92ZK95", manufacturer_id: "4", aisle_id: 4, occasion_id: 17},
  {description: "seed data", in_stock: 375, sku: "8985221953569|6208SCKO", manufacturer_id: "5", aisle_id: 4, occasion_id: 7},
  {description: "christmas cards", in_stock: 3000, sku: "7784073384382|PZIMIUYF", manufacturer_id: "1", aisle_id: 2, occasion_id: 1},
  {description: "seed data", in_stock: 75, sku: "7457362977090|IDMVJLYW", manufacturer_id: "2", aisle_id: 1, occasion_id: 4},
  {description: "test create", in_stock: 600, sku: "5667770275196|UJPX3846", manufacturer_id: "2", aisle_id: 2, occasion_id: 6}
])
Manufacturere.create!([
  {name: "American Greetings"},
  {name: "Carlton Cards"},
  {name: "Papyrus"},
  {name: "Recycled Paper Greetings"},
  {name: "Hallmark Card"}
])
Note.create!([
  {content: "testing note.create", employeeInit: "acm"},
  {content: "testing logout", employeeInit: "acm"},
  {content: "testing flash errors", employeeInit: "acm"},
  {content: "end notes", employeeInit: "acm"},
  {content: "did it work", employeeInit: "acm"},
  {content: "I did a lot of stuff with the computer to see if the custom message will transfer.", employeeInit: "acm"},
  {content: "working method", employeeInit: "sh"},
  {content: "think its closer", employeeInit: "rt"},
  {content: "Thought this was User.first", employeeInit: "acm"},
  {content: "store id. slow and steady", employeeInit: "pd"},
  {content: "last one, then a break", employeeInit: "rt"},
  {content: "did the caps thing work?", employeeInit: "Rh"},
  {content: "tons and tons of notes", employeeInit: "qw"},
  {content: "added employee credtials", employeeInit: "acm"},
  {content: "fixing delete button", employeeInit: "acm"},
])
Occasion.create!([
  {name_of: "Congratulations cards"},
  {name_of: "Farewell Cards"},
  {name_of: "Friendship Cards"},
  {name_of: "Good Luck Cards"},
  {name_of: "Birthday Cards"},
  {name_of: "Education Cards"},
  {name_of: "Love cards"},
  {name_of: "New Baby"},
  {name_of: "Valentine's Day"},
  {name_of: "Mother's Day"},
  {name_of: "Father's Day"},
  {name_of: "Spanish Cards"},
  {name_of: "Holidays Cards"},
  {name_of: "Religious Cards"},
  {name_of: "Holiday cards"},
  {name_of: "Christmas cards"}
])
User.create!([
  {employeeInit: "acm", store_id: "5340620431", password: nil, password_confirmation: nil, password_digest: "$2a$12$PxpJi9ClEUJQp4vHUrcJouEaS5Yu9aBa9ZgjaJqT4ehkfNGkKp.zG", email: "amcmullen9291@gmail.com", telephone: "7068818307", uid: nil, name: nil, provider: nil, email_confirmed: false, confirm_token: "bQ5S6ixR1CGTepLq-LmdUg"},
  {employeeInit: "DC", store_id: "5340620431", password: nil, password_confirmation: nil, password_digest: "$2a$12$B3i18VAtRNPfBZpzzYCZQO4Zwvc2itzlrCFnTw8n2yvk6OLoGww4G", email: "amcmullen9291@gmail.com", telephone: "7068818307", uid: nil, name: nil, provider: nil, email_confirmed: false, confirm_token: "IrNjob7pnDkJdF6IAw6ZLQ"}
])
ActiveStorage::Attachment.create!([
  {name: "avatar", record_type: "Card", record_id: 2, blob_id: 1},
  {name: "avatar", record_type: "Card", record_id: 3, blob_id: 2},
  {name: "avatar", record_type: "Card", record_id: 4, blob_id: 3},
  {name: "avatar", record_type: "Card", record_id: 5, blob_id: 4},
  {name: "avatar", record_type: "Card", record_id: 8, blob_id: 5}
])
ActiveStorage::Blob.create!([
  {key: "hiupz2avehkb9da5yt1c3gikdrzu", filename: "Italian-Greyhounds.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 37608, checksum: "wOrCRj9l7Ju74QSOXIX8vA=="},
  {key: "m0cnr95rc0nx90rfmwidivv5bsjs", filename: "Brussels-Griffon-4-645mk062311.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 69296, checksum: "pPEB45Bfn04NQFuTIwvORw=="},
  {key: "cd0lmkgcph6ppliq596ueca01lql", filename: "Emma-Milne-370x370.png", content_type: "image/png", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 142569, checksum: "PhEB2rs6SyGqLbTJ9f871Q=="},
  {key: "pekuiosj0yps4hq10pvz85ntdemr", filename: "Emma-Milne-370x370.png", content_type: "image/png", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 142569, checksum: "PhEB2rs6SyGqLbTJ9f871Q=="},
  {key: "p1gt2dpaa5j6fndpb20t0exd67mo", filename: "Brussels-Griffon.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "analyzed"=>true}, service_name: "local", byte_size: 37124, checksum: "qdJgSwcT2fV9/9UzT4unvQ=="}
])
