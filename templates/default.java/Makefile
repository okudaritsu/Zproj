JAVAC = javac
JAVA = java
CLASSPATH = .

.PHONY: all clean run
all: clean run
PROJECTNAME.class: PROJECTNAME.java
	$(JAVAC) -cp $(CLASSPATH) PROJECTNAME.java
run: PROJECTNAME.class
	$(JAVA) -cp $(CLASSPATH) PROJECTNAME
clean:
	rm -f *.class