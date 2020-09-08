using System;

namespace PlayingCard
{
    class Program
    {
        static void Main(string[] args)
        {
            var myDckOfCards = new DeckOfCards();
             myDckOfCards.Shuffe();

            for (var i = 0; i < 52; ++i)
            {
                Console.Write($"{myDckOfCards.Dealing(), -19}");


                if ((i + 1) % 4 == 0)
                {
                    Console.WriteLine();
                }
            }
        }
    }
}
