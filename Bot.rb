#!/usr/bin/ruby
class DailyTasks

    def initialize(arquivo)
        file = File.new(arquivo, "r")
        
        @lista = Hash.new
        while (line = file.gets)
            key, value = line.chop.split(":")
            @lista[key.to_sym] = value.split(";")
        end

        file.close    
    end

    def startTasks
        random = Random.new
        today = Time.now.strftime("Dia %d de %B de %Y")
        
        slowType("Olá mestre, hoje é dia #{today}\n")
        slowType("Conforme fui programado preparei uma lista de temas para estudar-mos hoje:\n")
        slowType("Os temas para hoje são:\n\n")

        @lista.each do |key,value|
            task = value.sample 
            slowType("\tA atividade do tipo #{key} é #{task}.\n")
        end
           
        slowType("\nDivirta-se mestre...\n")
        slowType("E mude o mundo hoje!\n")
    end

    private
    def slowType(text, speed = 0.1)
        text.split("").each do |letter|
            print letter
            sleep(speed)
        end
    end
end

%x("clear")
arquivo = ["./tasks/BackEnd.task", "./tasks/Management.task"].sample
DailyTasks.new(arquivo).startTasks
final = gets.chop