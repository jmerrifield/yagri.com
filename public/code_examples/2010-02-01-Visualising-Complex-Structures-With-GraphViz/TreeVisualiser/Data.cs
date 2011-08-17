namespace TreeVisualiser
{
    using System;

    partial class Predicate
    {
        public abstract void Accept(IPredicateVisitor visitor);
    }

    partial class RootPredicate
    {
        public override void Accept(IPredicateVisitor visitor)
        {
            visitor.Visit(this);
        }
    }

    partial class ComparePredicate
    {
        public override void Accept(IPredicateVisitor visitor)
        {
            visitor.Visit(this);
        }
    }

    partial class AndPredicate
    {
        public override void Accept(IPredicateVisitor visitor)
        {
            visitor.Visit(this);
        }
    }

    partial class OrPredicate
    {
        public override void Accept(IPredicateVisitor visitor)
        {
            visitor.Visit(this);
        }
    }
}
