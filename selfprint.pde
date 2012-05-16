BufferedReader reader;
String line;
PFont f;
int y = 0, fontSize = 12, maxLength = 0, counter = 0, numNums;
CodeLine[] lines = {};
class CodeLine {
  int index, len;
  String code;
  CodeLine(int i, String c) {    
    index = i;
    code = c;
    len = code.length();
  }
}
void setup() {
  size(1200, 800, P2D);
  fill(0, 0, 0);
  f = loadFont("Monaco-24.vlw");
  textFont(f, fontSize);
  reader = createReader("selfprint.pde");
  int i = 1;
  while(true) {
    try {
      line = reader.readLine();
    } catch (IOException e) {
      line = null;
    }
    if(line == null) break;
    CodeLine newLine = new CodeLine(i++, line);
    if(newLine.len > maxLength) maxLength = newLine.len;
    lines = (CodeLine[]) append(lines, newLine);
  }
  numNums = str(maxLength).length() + 1;

}
void draw() {
  translate(width/2, height/2);
  rotate(counter * 2 * PI / lines.length);
  text("     " + nf(lines[counter].index, numNums) 
      + " " + lines[counter].code, 15, fontSize + 20);
  counter++;
  if (counter == lines.length) noLoop(); 
}
