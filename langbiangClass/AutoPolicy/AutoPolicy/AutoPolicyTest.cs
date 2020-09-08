using System;



    class AutoPolicyTest
    {
    //    static void Main(string[] args)
    //    {
    //    AutoPolicy autoPolicy1 = new AutoPolicy(111111,"Toyuta Vios","MA");
    //    AutoPolicy autoPolicy2 = new AutoPolicy(222222,"Ford Everest", "RH");
    //    policyInNoFaultState(autoPolicy1);
    //    policyInNoFaultState(autoPolicy2);

    //    }
    //public static void policyInNoFaultState(AutoPolicy autoPolicy) 
    //{
    //    Console.WriteLine("The auto Policy");
    //    Console.Write($"Account: {autoPolicy.AccountNumber}; ");
    //    Console.WriteLine($"Make and Model: {autoPolicy.MakeAndModel}");
    //    Console.Write($"State: {autoPolicy.State}; ");
    //    Console.Write($"{(autoPolicy.IsNoFaultState ? "is: ": "is not: ")}");
    //    Console.WriteLine("a No- fault");
    //}

    //
     static void Main()
    {
        // &&
        //Console.WriteLine("dieu kien And (&&)");
        //Console.WriteLine($"false && false: { false && false}");
        //Console.WriteLine($"false && true: {false && true}");
        //Console.WriteLine($"true && false: {true && false}");
        //Console.WriteLine($"true && true: {true && true}\n");

        //// ||
        //Console.WriteLine("dieu kien And (||)");
        //Console.WriteLine($"false || false: {false || false}");
        //Console.WriteLine($"false || true: {false || true}");
        //Console.WriteLine($"true || false: {true || false}");
        //Console.WriteLine($"true || true: {true || true}\n");

        //// &
        //Console.WriteLine("dieu kien And (&)");
        //Console.WriteLine($"false & false: { false & false}");
        //Console.WriteLine($"false & true: {false & true}");
        //Console.WriteLine($"true & false: {true & false}");
        //Console.WriteLine($"true & true: {true & true}\n");

        //// |
        //Console.WriteLine("dieu kien And (|)");
        //Console.WriteLine($"false | false: {false | false}");
        //Console.WriteLine($"false | true: {false | true}");
        //Console.WriteLine($"true | false: {true | false}");
        //Console.WriteLine($"true | true: {true | true}\n");

        //// ^
        //Console.WriteLine("Boolean logical exlusive OR (|)");
        //Console.WriteLine($"false ^ false: {false ^ false}");
        //Console.WriteLine($"false ^ true: {false ^ true}");
        //Console.WriteLine($"true ^ false: {true ^ false}");
        //Console.WriteLine($"true ^ true: {true ^ true}\n");

        //Console.WriteLine("phu dinh (!)");
        //Console.WriteLine($"! false: {!false}");
        //Console.WriteLine($"! false: {! true}");
        //double giatri = Math.Sqrt(9);

        //Console.WriteLine(giatri);
        //Console.Write("nhap so dau tien: ");
        //double number1 = double.Parse(Console.ReadLine());
        //Console.Write("nhap so thu hai: ");
        //double number2 = double.Parse(Console.ReadLine());
        //Console.Write("nhap so thu ba: ");
        //double number3 = double.Parse(Console.ReadLine());

        //double result = Math.Max(number1, Math.Max(number2, number3));

        //Console.WriteLine("so lon nhat la:" +result);
        //Random rd = new Random();
        //int value = rd.Next(1,7);
        //Console.WriteLine(value);

        int mat1 = 0;
        int mat2 = 0;
        int mat3 = 0;
        int mat4 = 0;
        int mat5 = 0;
        int mat6 = 0;

        for (int i= 0;i < 60000; i++)
        {
            Random quaysucsac = new Random(); // tao ra lop random
            int ketqua = quaysucsac.Next(1,7);
            switch (ketqua)
            {
                case 1:
                    mat1++;
                    break;
                case 2:
                    mat2++;
                    break;
                case 3:
                    mat3++;
                    break;
                case 4:
                    mat4++;
                    break;
                case 5:
                    mat5++;
                    break;
                case 6:
                    mat6++;
                    break;
            }
            
        }
        Console.WriteLine("mat\t solan");
        Console.WriteLine($"1:\t{mat1,5}\n2:\t{mat2,5}");
        Console.WriteLine($"3:\t{mat3,5}\n4:\t{mat4,5}");
        Console.WriteLine($"5:\t{mat5,5}\n6:\t{mat6,5}");

        Console.WriteLine();

    } // end Main


}

