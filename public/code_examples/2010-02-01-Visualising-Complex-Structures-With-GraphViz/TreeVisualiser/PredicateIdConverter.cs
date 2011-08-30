using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TreeVisualiser
{
    public class PredicateIdConverter
    {
        private int currentId = 0;
        private Dictionary<Guid, int> idMap = new Dictionary<Guid, int>();

        public string GetIdFor(Predicate predicate)
        {
            if (!idMap.ContainsKey(predicate.Id))
            {
                idMap[predicate.Id] = ++currentId;
            }

            return predicate.PredicateType + "_" + idMap[predicate.Id].ToString();
        }
    }
}
