
# There is a treasure vault with 100 boxes.  
# Each of the boxes is locked.
# An adventurer has been rewarded with treasure, but she must follow these instructions:
# "Take this key, and with it, unlock every treasure box.  
# Then, starting from the beginning, unlock every other box. 
# Starting again from the beginning, take every third box; if it is locked, 
# unlock it; and if it is unlocked, lock it.
# Starting each time from the beginning, do this every fourth box, every fifth box, and so on, 
# until you switch only the 100th box.  
# Do this, and you may take the treasure from every box that is unlocked."
# Which treasure boxes is the adventurer allowed to open?


class Vault
  def initialize(number_of_boxes = 100)
    @number_of_boxes = number_of_boxes
    @boxes = []
  end

  def fill_with_boxes
    @number_of_boxes.times do |n|
      @boxes << Box.new
    end
  end
    
  def process
    100.times do |i|
      @boxes.each_with_index do |box, box_number|
        if (box_number + 1) % (i + 1) == 0
          box.toggle 
        end
      end
    end
  end

  def report
    @boxes.each_with_index do |box, box_number|
      if box.status == :unlocked 
        puts box_number + 1 
      end
    end
  end

  def gimme
    fill_with_boxes
    process
    report
  end
end

class Box

  attr_accessor :status

  def initialize(status = :locked)
    @status = status
  end

  def toggle
    if @status == :unlocked
       @status = :locked
    else
       @status = :unlocked
     end
   end
end







