class OpenAddressingHashing
  @hastTable=Array.new();
  @slots=-1;
  
  def initialize(m)
    @hashTable=Array.new(m, "NULL");
    @slots=m;
  end
  
  def HashInsert(key, value)
    hash1=key.modulo(@slots);
    hash2=1+(key.modulo(@slots-1));
      
    for i in 0..@slots-1
      
      hashIndex=(hash1 + (i * hash2)).modulo(@slots);
      
      if (@hashTable[hashIndex]=="NULL")
        @hashTable[hashIndex]=value;
        return;
      end
        
      
    end
    
    puts "Hash Table Overflow...inserting <#{value}>";
  end
  
  def HashSearch(key)
    
  end
  
  def HashDisplay()
    puts @hashTable;
    end
end

hashTable = OpenAddressingHashing.new(11);
random=Random.new(123);
for i in 1..12
  key=random.rand(100);
  hashTable.HashInsert(key,"#{key} -> Value #{i}");
end
hashTable.HashDisplay();