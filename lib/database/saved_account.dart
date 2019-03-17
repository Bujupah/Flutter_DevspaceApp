class Account {
    int accountId;
    String accountName;
    String accountEmail;
    String accountClass;
    int accountPhone;

    Account({
        this.accountId,
        this.accountName,
        this.accountEmail,
        this.accountClass,
        this.accountPhone,
    });

    int get id => accountId;
    String get name => accountName;
    String get email => accountEmail;
    String get nclass => accountClass;
    int get phone => accountPhone;


    Account.fromMap(Map<String, dynamic> map){
        this.accountId = map["id"];
        this.accountName = map["name"];
        this.accountEmail = map["email"];
        this.accountClass = map["class"];
        this.accountPhone = map["phone"];
    }

    Map<String, dynamic> toMap() {
      var map = new Map<String, dynamic>();
        if (accountId != null) {
          map['id'] = accountId;
        }
        map["name"] =  accountName;
        map["email"] = accountEmail;
        map["class"] = accountClass;
        map["phone"] =  accountPhone;
    return map;
    }
    
}