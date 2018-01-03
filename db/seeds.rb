Message.delete_all
Client.delete_all

Message.create originator: 'James', recipient: 'Martin',
               content: 'My first message', status: 1
Message.create originator: 'Marie', recipient: 'Patricia',
               content: 'Hello World', status: 3

Client.create name: 'product-review-center', domain: 'www.prodrevcenter.com',
              password: '5469secure'