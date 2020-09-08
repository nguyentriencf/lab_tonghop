using System;

    class Account
{
    // tinh dong goi: encapsolution
    // thuoc tinh: property, attribute
    // private, public, protected,: modifier (từ khóa để xác định phạm vi truy cập)
    //private string name; // instance variable
    //private double balance;
    //// phuong thuc: Mothod or ham: (function)
    //public void SetName(string accountName) // instance varialbe
    //{
    //    name = accountName;
    //}
    // // OOP: lập trình hướng đối tượng (Object oriented programming)
    //public string GetName()// API -> application program interface
    //{
    //    return name;
    //}
    public string Name { get; set; } // auto- imlemented property
    private decimal balance; // instance variale

    // Account constructor that receives two parameters
    public Account(string nameAccount, decimal initialBanlance)
    {
        Name = nameAccount;
        balance = initialBanlance; // Balance's set accessor validation
    }

    // Banlance property with validation
    public decimal BaLance
    {
        get { return balance; }
        private set // can be used only within the class
        { 
            // validate that  the banlance is greater than 0.0, if it's not,
            // instance variable balance keeps it's pior value
            if(value > 0.0m) // m indicates that 0.0 is valid
            {
                balance = value;
            }

        }
    }

    public void WithDraw(decimal withdraw)
    {
        if(balance >0)
            if(withdraw <= BaLance)
            {
                BaLance = BaLance - withdraw;
            }
    }
     
    // method that deposits (add) only a valid amount    to the balance
     public void Deposit(decimal depositAccount)
    {
        if(depositAccount > 0.0m)
        {
            BaLance = BaLance + depositAccount;
        }
    }
}
    

      
    

    
    

