gpp +c "//" "\\n" --nostdinc -o preproc.jasm ../src/arch/jittery-main.jasm
java -classpath ../../jittery-assembler/bin/ net.ttlhacker.jittery.VmHeaderGeneratorMain > ../src/hdrgen/vmhdr.h
java -classpath ../../jittery-assembler/bin/ net.ttlhacker.jittery.JitteryAssemblerMain preproc.jasm 10 > ../src/hdrgen/vmprogram.cgen
