using System;
using System.Collections.Generic;
using System.Text;

namespace AutoPolicy
{
    class Craps
    {
        //private static Random randomNumber = new Random();
        //private  enum Status
        //{
        //    Continue, Win, Lost
        //}

        //private enum NameDice
        //{
        //    HaiNut =2,
        //    BaNut = 3,
        //    BayNut = 7,
        //    eleven =11,
        //    twelty =12,
        //} 

        //static void Main()
        //{
        //    Console.WriteLine("nhan phim bat ki de bat dau");

        //    string Nhucau = Console.ReadLine();

        //    do
        //    {
        //        Status trangThaiGame = Status.Continue;

        //        int NgoaiLe = 0;

        //        int TongHaiLanQuay = QuaySo();

        //        switch ((NameDice) TongHaiLanQuay)
        //        {
        //            case NameDice.BayNut:
        //            case NameDice.eleven:
        //                trangThaiGame = Status.Win;
        //                break;
        //            case NameDice.HaiNut:
        //            case NameDice.BaNut:
        //            case NameDice.twelty:
        //                trangThaiGame = Status.Lost;
        //                break;
        //            default:
        //                trangThaiGame = Status.Continue;
        //                NgoaiLe = TongHaiLanQuay;
        //        break;

        //        }
        //        while (trangThaiGame == Status.Continue)
        //        {
        //            TongHaiLanQuay = QuaySo();
        //            if (TongHaiLanQuay == (int)NameDice.BayNut)
        //            {
        //                trangThaiGame = Status.Lost;
        //            }
        //            else if (TongHaiLanQuay == NgoaiLe)
        //            {
        //                trangThaiGame = Status.Win;
        //            }
        //        }

        //        if (trangThaiGame == Status.Lost)
        //        {
        //            Console.WriteLine("You lost!");
        //        }
        //        else
        //        {
        //            Console.WriteLine("You WIN ");
        //        }
        //        Console.Write("nhan phim 'k de thoat game:'");

        //        Nhucau = Console.ReadLine().ToString();


        //    } while ( Nhucau =="k" );

        //}

        //static int QuaySo()
        //{
        //    int lan1 = randomNumber.Next(1, 7);
        //    int lan2 = randomNumber.Next(1, 7);
        //    int sum = lan1 + lan2;
        //    Console.WriteLine($"{lan1} +{lan2} = {sum}");
        //    return sum;
        //}
        static void Main()
        {
            int[] phanhoi = { 1, 2, 3, 4, 5, 8, 3, 2, 1, 4, 5, 5, 2, 1 };
            int[] TangSo = new int[6];

            foreach (var item in phanhoi)
            {
                try
                {
                    ++TangSo[item];
                }
                catch (IndexOutOfRangeException ex)
                {
                    Console.WriteLine($"{ex.Message}");

                    Console.WriteLine($"cau tra loi vuot qua gioi han cua mang {item} = {phanhoi[item]}");
                    
                }
            }

            Console.WriteLine($"{"ti le"}{"so luong",10}");

            for (var tile = 1; tile < TangSo.Length; ++tile)
            {
                Console.WriteLine($"{tile}{TangSo[tile],8}");
            }

        }  
    }
}
