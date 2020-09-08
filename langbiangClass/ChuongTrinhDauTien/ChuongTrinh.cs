// Text-display app
using System;



class Addition
{
    static void Main()
    {
        int number1; // declare first number to add
        int number2; // declare second number to add
        int sum;
        Console.Write("Enter first integer: "); // prompt user
        // read first number from user
        number1 = int.Parse(Console.ReadLine());
        Console.Write("Enter second integer: "); // prompt user
        number2 = int.Parse(Console.ReadLine());
        sum = number1 + number2; // add numbers
        Console.WriteLine($"Sum is {sum}"); // display sum
    } // end Main
} // end class Addition
