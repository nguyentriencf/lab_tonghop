using System;



    class GradeBook
{
    private int[,] grades;
    public string TenKhoa { get; }

    public GradeBook(string name, int[,] grade)
    {
        TenKhoa = name;
        grades = grade;
    }
    public void Pocessor()
    {
        Display();
        OutputGrade();
        Console.WriteLine($"diem thap nhat la: {GetMinimum():F} \n" +
            $"diem cao nhat la: {GetMinimum()}");
        Console.WriteLine();
        DistributeGrade();

    }
    public void Display()
    {
        Console.WriteLine("Welcom to the grade book for\n " +
            $"{TenKhoa}");
    }
    
    public int GetMaximum()
    {
        int diemcaonhat = grades[0,0];
        foreach (var item in grades)
        {
            if (item > diemcaonhat)
            {
                diemcaonhat = item;
            }
        }
        return diemcaonhat;
    }
    public int GetMinimum()
    {
        int diemthapnhat = grades[0, 0];
        foreach ( var  item in grades)
        {
            if (item < diemthapnhat)
            {
                diemthapnhat = item;
            }
        }
        return diemthapnhat;
    }

    public double Average(int student)
    {
        var total = 0;
        var gradeCount = grades.GetLength(1);
        for (int exam = 0; exam < gradeCount; exam++)
        {
            total += grades[student, exam];
        }
        return total / gradeCount;
    }
    public void OutputGrade()
    {
        Console.WriteLine("the grades are: \n");
        Console.Write("              ");

        // tao ra cột ra cho mỗi bài kiểm tra
        for (int test = 0; test < grades.GetLength(1); test++)
        {
            Console.Write($"test {test + 1}  ");
        }

        Console.WriteLine("Average");

        for (int student = 0; student < grades.GetLength(0); student++)
        {
            Console.Write($"Student {student + 1,2}");
            for (int diem = 0; diem < grades.GetLength(1); diem++)
            {
                Console.Write($"{grades[student, diem],8}");
            }
            Console.WriteLine($"{Average(student), 9:F}");
            
        }
        
    }
    public void DistributeGrade()
    {
        int[] distribute = new int[11];

        Console.WriteLine("overrall grade distribution:");

        foreach (var item in grades)
        {
            ++distribute[item/10];
        }
        for (int count = 0; count < distribute.Length; count++)
        {
            if (count == 10)
            {
                Console.Write("  100: ");
            }
            else
            {
                Console.Write($"{count*10:D2}-{count*10 +9:D2}");
            }
            for (int i = 0; i < distribute[count]; i++)
            {
                Console.Write("*");
            }
            Console.WriteLine();
        }

        
    }
}
