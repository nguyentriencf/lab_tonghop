using System;
using System.Collections.Generic;
using System.Text;


    class Multil_Dimension
{
    static void Main()
    {
        int[,] rectangular =
        {
            {1, 2, 3 },
            {6, 7, 8 }
        };
        int[][] jagged =
        {
            new int[] {1, 2 },
            new int[] { 2, 4, 5},
            new int[] {6}
            
        };
        OutputArray(rectangular);
        Console.WriteLine();
        OutputArray(jagged);
        Console.WriteLine();
        Console.WriteLine($"{Average(1.0,2.0, 3.0):F1}");
        
    }
    static void OutputArray(int[,] array)
    {
        Console.WriteLine("mang rectangular: ");
        for (var row = 0; row < array.GetLength(0); ++row)
        {
            for (var column = 0; column < array.GetLength(1); column++)
            {
                Console.Write($" {array[row, column]} ");
            }
            Console.WriteLine();
        }
    }
    static void OutputArray(int[][] array)
    {
        Console.WriteLine("mang jagged");
        foreach (var row in array)
        {
            //foreach (var elemet in row)
            //{
            //    Console.Write($"{elemet } ");
            //}
            for (int i = 0; i < row.Length; i++)
            {
                Console.Write($"{row[i]} ");
            }
            Console.WriteLine();

        }
       

    }
    static double Average(params double[] number)
    {
        var total = 0.0;

        foreach (var d in number)
        {
            total += d;
        }
        return number.Length != 0 ? total / number.Length  : 0.0;
    }

}

