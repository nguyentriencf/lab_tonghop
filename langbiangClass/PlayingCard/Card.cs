using System;




class Card
{
        private string Face { get; }
        private string Suit { get; }

        public Card(string face, string suit)
        {
            Face = face;
            Suit = suit;
        }

        // xuất lá bài
        public override string ToString()
        => $"{Face} of {Suit} ";
}
