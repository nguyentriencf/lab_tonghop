using System;
    class Program
    {
        static void Main(string[] args)
    {
        int[,] array = { {80, 89, 70 },
                       {100,78,69 },
                       { 80,50,40 },
                       {80,89,70 },
                       {80,89,70 },
                        {100,78,69 },
                       { 80,50,40 },
                       {80,89,70 },
                        {80,89,70 },
                        {100,78,69 },
        };
        GradeBook gradeBook = new GradeBook("C#", array);
        gradeBook.Pocessor();

    }
        
    }

