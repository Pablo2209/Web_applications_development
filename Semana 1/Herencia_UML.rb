
class Appointment
    attr_accessor :location, :purpose, :hour, :min #Se define el getter y setter
    def initialize (location, purpose, hour, min) #En este caso, este método define location, purpose, hour y min
        raise ArgumentError, 'min is not an Integer' if min.class !=Integer 
        raise ArgumentError, 'hour is not an Integer' if hour.class !=Integer
        raise ArgumentError, 'location is not an String' if location.class !=String
        raise ArgumentError, 'purpose is not an String' if purpose.class !=String
        @location = location
        @purpose = purpose
        @hour = hour
        @min = min
    end
end


class MonthlyAppointment < Appointment  
    attr_accessor :day #Se define el getter y el setter de la instancia que es exclusiva de este hijo
    def initialize(location, purpose, hour, min, day) #Se definen los parámetros anteriores + el day (instancia exclusiva de este hijo)
        raise ArgumentError, 'day is not an number' if day.class !=Integer
        super(location, purpose, hour, min) #El padre, "Appointment", recibe parámetros, por lo tanto llamándolo con super, se le puede pasar también parámetros.
        @day = day #"Especializamos" esta clase con day
    end

    def occurs_on?(day) #Recordar que los métodos que finalizan con el signo "?" devuelven "true" o "false"
        @day == day #¿Es @day igual a day?
    end

    def to_s #El método to_s devuelve todo en un string mediante el "puts", que implícitamente llama a un string siempre
        puts "Reunión mensual en #{self.location} sobre #{self.purpose} el día #{self.day} a la(s) #{self.hour}:#{self.min}."
    end
end

#Child 2
class DailyAppointment < Appointment
    def occurs_on?(hour, min)
        @hour == hour
        @min == min
    end

    def to_s
        puts "Reunión diaria en #{self.location} sobre #{self.purpose} a la(s) #{self.hour}:#{self.min}"
    end
end


class OneTimeAppointment < Appointment
    attr_accessor :day, :month, :year
    def initialize(location, purpose, hour, min, day, month, year)
        raise ArgumentError, 'day is not an Integer' if day.class !=Integer
        raise ArgumentError, 'month is not an Integer' if month.class !=Integer
        raise ArgumentError, 'year is not an Integer' if year.class !=Integer
        super(location, purpose, hour, min)
        @day = day
        @month = month
        @year = year
    end

    def ocurrs_on?(day, month, year)
        @day == day
        @month == month
        @year == year
    end

    def to_s
        puts "Reunión única en #{self.location} sobre #{self.purpose} el #{self.day}/#{self.month}/#{self.year} a la(s) #{self.hour}:#{self.min}"
    end
end
puts onetimebooking = OneTimeAppointment.new('Desafío Latam', 'Trabajo', 14, 30, 4, 6, 2019)
puts monthlybooking = MonthlyAppointment.new('NASA', 'Aliens', 8, 15, 23)
puts dailybooking = DailyAppointment.new('Desafío Latam', 'Educación', 8, 15)
