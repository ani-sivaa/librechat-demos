# Sample Files for LibreChat Educational Demos

This directory contains sample files for demonstrating LibreChat's educational assessment capabilities with **FREE AI models**.

## 📁 File Categories

### Programming Files
- **`calculator.js`** - JavaScript calculator class for code review demos
- **`fibonacci.py`** - Python Fibonacci implementation (in demos/02-mcp-integration/)
- **`student_code.py`** - Sample student programming assignment

### Data Files
- **`student_grades.csv`** - Sample grade data for analysis
- **`research_data.json`** - Sample research dataset
- **`survey_results.xlsx`** - Student survey responses

### Documents
- **`sample_essay.txt`** - Student essay for grading demos
- **`research_paper.pdf`** - Academic paper excerpt
- **`assignment_rubric.md`** - Grading rubric template

### Images
- **`math_problem.png`** - Handwritten math problem
- **`diagram.jpg`** - Scientific diagram for analysis
- **`chart.png`** - Data visualization example

## 🎯 Usage in Demos

### Demo 01: Basic Setup
- Upload `calculator.js` to test code analysis
- Try `sample_essay.txt` for text processing

### Demo 02: MCP Integration
- Use `fibonacci.py` for file system access demo
- Analyze `student_grades.csv` with web search verification

### Demo 03: Artifacts Showcase
- Generate interactive versions of static content
- Create visualizations from `student_grades.csv`

### Demo 04: Code Interpreter
- Execute and analyze `calculator.js`
- Run data analysis on `student_grades.csv`

## 📊 Educational Applications

### For Computer Science Courses
```
Upload: calculator.js
Prompt: "Review this code for correctness, efficiency, and style. Provide detailed feedback and suggestions for improvement."
```

### For Data Science Courses
```
Upload: student_grades.csv
Prompt: "Analyze this grade data. Calculate statistics, identify trends, and create visualizations."
```

### For Writing Courses
```
Upload: sample_essay.txt
Prompt: "Grade this essay using a standard rubric. Provide feedback on structure, content, and grammar."
```

### For Mathematics Courses
```
Upload: math_problem.png (if using Gemini)
Prompt: "Solve this handwritten math problem step by step. Show all work and explain each step."
```

## 🔧 File Specifications

### Supported Formats
- **Text**: .txt, .md, .csv, .json
- **Code**: .py, .js, .java, .cpp, .html, .css
- **Documents**: .pdf, .docx (with appropriate models)
- **Images**: .jpg, .png, .gif (Gemini only)
- **Data**: .csv, .json, .xlsx

### Size Limits
- **Individual files**: 25MB max (configurable)
- **Total per conversation**: 100MB max
- **Recommended**: Keep files under 10MB for best performance

### Privacy Considerations
- **Local models** (Ollama): Files never leave your server
- **Cloud models** (Gemini): Files processed according to provider policies
- **Educational compliance**: Configure retention and deletion policies

## 🚀 Creating Your Own Sample Files

### For Programming Courses
```bash
# Create sample student submission
cat > student_assignment.py << 'EOF'
# Student: John Doe
# Assignment: Sorting Algorithms

def bubble_sort(arr):
    n = len(arr)
    for i in range(n):
        for j in range(0, n-i-1):
            if arr[j] > arr[j+1]:
                arr[j], arr[j+1] = arr[j+1], arr[j]
    return arr

# Test the function
test_array = [64, 34, 25, 12, 22, 11, 90]
print("Original array:", test_array)
sorted_array = bubble_sort(test_array.copy())
print("Sorted array:", sorted_array)
EOF
```

### For Data Analysis
```bash
# Create sample dataset
cat > class_performance.csv << 'EOF'
Student,Quiz1,Quiz2,Midterm,Final,Participation,Total
Alice,85,92,88,91,95,90.2
Bob,78,82,75,79,85,79.8
Carol,95,98,92,94,100,95.8
David,67,72,69,71,75,70.8
Emma,88,85,90,87,92,88.4
EOF
```

### For Writing Assessment
```bash
# Create sample essay
cat > student_essay.txt << 'EOF'
The Impact of Technology on Modern Education

Technology has fundamentally transformed the landscape of modern education, creating both opportunities and challenges for students, educators, and institutions worldwide. This essay examines the multifaceted impact of technology on educational practices, learning outcomes, and the future of academic instruction.

[Continue with full essay content...]
EOF
```

## 📈 Assessment Metrics

### Code Quality Assessment
- **Correctness**: Does the code work as intended?
- **Efficiency**: Is the algorithm optimal?
- **Style**: Does it follow best practices?
- **Documentation**: Are comments clear and helpful?

### Writing Assessment
- **Thesis Clarity**: Is the main argument clear?
- **Evidence**: Are claims supported with evidence?
- **Organization**: Is the structure logical?
- **Grammar**: Are there mechanical errors?

### Data Analysis Assessment
- **Accuracy**: Are calculations correct?
- **Interpretation**: Are conclusions valid?
- **Visualization**: Are charts clear and informative?
- **Methodology**: Is the approach appropriate?

## 🎓 Educational Value

### Cost Savings
- **$0 cost** for unlimited file analysis
- **No per-upload fees** like commercial platforms
- **Scalable** to thousands of students

### Privacy Benefits
- **Local processing** option with Ollama
- **Institutional control** over sensitive data
- **FERPA compliance** capabilities

### Pedagogical Advantages
- **Immediate feedback** for students
- **Consistent grading** across instructors
- **24/7 availability** for assignment help
- **Detailed explanations** for learning

---

**Ready to test these files?** Upload them to LibreChat and explore the educational assessment capabilities! 🎓✨
