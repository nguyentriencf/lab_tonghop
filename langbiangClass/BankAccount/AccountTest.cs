using System;

    class AccountTest
{
        static void Main(string[] args)
    {
        //Account myAccount = new Account(); // hàm khởi tạo (contructor)

        //Console.WriteLine($"Ten khoi tao cua tai khoan la:{myAccount.GetName()}"); 

        //Console.WriteLine("Nhap ten cua cho tai khoan: ");
        //string theName = Console.ReadLine();
        //// tham so: (parametter): cái cần  phải truyền cho hàm để nó chay - khi định nghĩa hàm 
        //// theName: (argument: đối số) cái cần truyền  cho hàm để nó chạy - khi gọi hàm 
        //myAccount.SetName(theName);
        //Console.WriteLine($"Ten cua tai khoan myAccount la: {myAccount.GetName()}");
        Account account1 = new Account("TRIEN",40.000m);
        
        Console.WriteLine($"{account1.Name} balanece {account1.BaLance}");

        Console.WriteLine("Nhan phim R de rut tien. Nhan phim G de gui tien");
        char Rut = char.Parse(Console.ReadLine());
        
        if(Rut == 'g')
        {
            Console.Clear();
            Console.WriteLine("nhap so tien can gui: ");
            decimal deponsitAccount = decimal.Parse(Console.ReadLine());
            account1.Deposit(deponsitAccount);
            Console.Write($"so du hien tai: {account1.BaLance:C}");
        }
        // yêu cầu người nhập số tiền gửi
        else if(Rut == 'r')
        {
            Console.Write($"so du hien tai: {account1.BaLance:C}");
            Console.Write("nhap so tien muon rut");
            decimal withdraw = decimal.Parse(Console.ReadLine());
            account1.WithDraw(withdraw);
            Console.WriteLine($"so du trong tk la: {account1.BaLance}");

        }



    }
}

