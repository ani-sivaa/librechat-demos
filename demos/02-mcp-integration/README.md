# Demo 02: MCP Integration - Extending LibreChat Capabilities

## Objective
Demonstrate how Model Context Protocol (MCP) servers extend LibreChat with powerful tools for educational assessment, including file system access and web search capabilities.

## Duration
20 minutes - Comprehensive feature demonstration

## Cost
$0 - All MCP servers and tools are completely free

---

## What is MCP?

**Model Context Protocol (MCP)** allows AI models to access external tools and data sources securely. For education, this means:

- **File System Access**: AI can read and analyze student submissions
- **Web Search**: Real-time research and fact-checking
- **Database Queries**: Access to institutional data
- **Custom Tools**: Specialized educational applications

---

## Available MCP Servers

### 1. Filesystem Server
**Purpose**: Access and analyze files for educational assessment

**Capabilities**:
- Read student assignment files
- Analyze code submissions
- Process research documents
- Grade written assignments

### 2. Web Search Server
**Purpose**: Real-time information retrieval and fact-checking

**Capabilities**:
- Current events research
- Source verification
- Fact-checking claims
- Finding educational resources

### 3. Assessment Tools Server (Custom)
**Purpose**: Specialized educational assessment functions

**Capabilities**:
- Rubric-based grading
- Plagiarism detection
- Citation checking
- Statistical analysis

---

## Demo Steps

### Step 1: Verify MCP Configuration (3 minutes)

1. **Check MCP Servers Status**:
   ```bash
   # View MCP configuration
   docker compose exec librechat cat /app/librechat.yaml | grep -A 20 mcpServers
   ```

2. **Verify in LibreChat UI**:
   - Open LibreChat at `http://localhost:3080`
   - Look for MCP server indicators in the interface
   - Check available tools in model settings

### Step 2: Filesystem Access Demo (7 minutes)

1. **Prepare Sample Files**:
   ```bash
   # Create sample student submissions
   mkdir -p demos/02-mcp-integration/sample-submissions
   
   # Sample Python assignment
   cat > demos/02-mcp-integration/sample-submissions/student_code.py << 'EOF'
   def fibonacci(n):
       if n <= 1:
           return n
       else:
           return fibonacci(n-1) + fibonacci(n-2)
   
   # Test the function
   for i in range(10):
       print(f"F({i}) = {fibonacci(i)}")
   EOF
   
   # Sample essay
   cat > demos/02-mcp-integration/sample-submissions/essay.txt << 'EOF'
   Climate Change and Its Impact on Education
   
   Climate change is one of the most pressing issues of our time. It affects not only our environment but also our educational systems. Schools in coastal areas face flooding, while those in drought-prone regions struggle with water shortages.
   
   The impact on student learning is significant. When schools close due to extreme weather, students miss valuable instruction time. This is particularly challenging for students from low-income families who may not have access to online learning resources.
   
   Educational institutions must adapt by developing climate-resilient infrastructure and incorporating climate education into their curricula. This will help prepare students for a future where climate adaptation is essential.
   EOF
   ```

2. **File Analysis Demo**:
   ```
   Prompt: "Please analyze the Python code in the file student_code.py. Evaluate it for:
   1. Correctness
   2. Efficiency 
   3. Code style
   4. Suggest improvements
   5. Assign a grade out of 100"
   ```

3. **Essay Grading Demo**:
   ```
   Prompt: "Please grade the essay in essay.txt using this rubric:
   - Thesis clarity (25 points)
   - Supporting evidence (25 points)
   - Organization (25 points)
   - Grammar and style (25 points)
   
   Provide detailed feedback and a total score."
   ```

### Step 3: Web Search Integration Demo (7 minutes)

1. **Current Events Research**:
   ```
   Prompt: "Search for the latest developments in AI in education from 2024. Provide:
   1. Three recent breakthroughs
   2. Key research findings
   3. Credible sources for each claim
   4. Implications for classroom teaching"
   ```

2. **Fact-Checking Demo**:
   ```
   Prompt: "Please fact-check these claims about renewable energy:
   1. 'Solar power costs have decreased by 80% since 2010'
   2. 'Wind energy now provides 25% of US electricity'
   3. 'Battery storage costs have fallen by 90% in the last decade'
   
   For each claim, verify with current sources and provide accuracy ratings."
   ```

3. **Research Assistance**:
   ```
   Prompt: "I'm writing a paper about the impact of social media on teenage mental health. Please search for:
   1. Recent peer-reviewed studies (2022-2024)
   2. Statistical data on usage and mental health
   3. Expert opinions from psychologists
   4. Provide proper citations for academic use"
   ```

### Step 4: Combined MCP Capabilities (3 minutes)

1. **Comprehensive Assignment Review**:
   ```
   Prompt: "I have a student research paper in research_paper.pdf. Please:
   1. Read and summarize the main arguments
   2. Fact-check the key claims using web search
   3. Evaluate the quality of sources cited
   4. Check for potential plagiarism indicators
   5. Provide a comprehensive grade and feedback"
   ```

2. **Code Project Assessment**:
   ```
   Prompt: "Analyze the programming project in the /projects folder:
   1. Review all code files for functionality
   2. Check if the implementation matches current best practices (search for recent standards)
   3. Test the code logic
   4. Provide detailed feedback and suggestions
   5. Grade according to computer science rubric"
   ```

---

## Success Criteria

Mark each as completed:

**MCP Setup**:
- [ ] MCP servers visible in LibreChat configuration
- [ ] Filesystem access working (can read demo files)
- [ ] Web search integration functional

**File Analysis**:
- [ ] AI successfully reads and analyzes code files
- [ ] Essay grading provides detailed, rubric-based feedback
- [ ] File content is accurately interpreted

**Web Search**:
- [ ] Current information retrieval working
- [ ] Fact-checking provides source verification
- [ ] Research assistance finds relevant academic sources

**Combined Capabilities**:
- [ ] AI can use multiple MCP tools in single conversation
- [ ] Complex assessment tasks completed successfully
- [ ] Educational workflows demonstrated effectively

---

## Educational Applications

### For Computer Science
- **Code Review**: Automated analysis of programming assignments
- **Best Practices**: Real-time checking against current standards
- **Debugging Help**: AI identifies and explains code issues
- **Project Assessment**: Comprehensive evaluation of software projects

### For Research Courses
- **Source Verification**: Fact-checking and credibility assessment
- **Literature Review**: Finding and summarizing relevant papers
- **Citation Checking**: Verifying accuracy of references
- **Current Events**: Incorporating latest developments

### For Writing Courses
- **Essay Analysis**: Detailed feedback on structure and content
- **Fact-Checking**: Verifying claims and statistics
- **Source Quality**: Evaluating credibility of references
- **Plagiarism Detection**: Identifying potential academic integrity issues

### For All Subjects
- **Assignment Processing**: Automated reading and initial assessment
- **Research Integration**: Combining file analysis with web research
- **Comprehensive Feedback**: Multi-faceted evaluation using various tools
- **Real-time Updates**: Access to current information and standards

---

## Technical Configuration

### MCP Server Setup

**Filesystem Server**:
```yaml
mcpServers:
  assessment-filesystem:
    command: npx
    args: ["-y", "@modelcontextprotocol/server-filesystem", "/app/demos"]
    iconPath: /assets/icons/filesystem.svg
    timeout: 30000
    description: "Access demo files and student submissions"
```

**Web Search Server**:
```yaml
  web-search:
    command: npx
    args: ["-y", "@modelcontextprotocol/server-web-search"]
    timeout: 30000
    iconPath: /assets/icons/web-search.svg
    description: "Search the web for current information"
```

### Security Considerations

**File Access**:
- Restrict to specific directories
- Implement read-only access for student files
- Log all file access for audit trails
- Sanitize file paths to prevent directory traversal

**Web Search**:
- Rate limiting to prevent abuse
- Content filtering for educational appropriateness
- Source credibility scoring
- Cache results to improve performance

---

## Performance Metrics

### File Processing
- **Small files** (< 1MB): ~2-5 seconds
- **Medium files** (1-10MB): ~5-15 seconds
- **Large files** (10-50MB): ~15-60 seconds
- **Supported formats**: Text, code, PDF, images (with Gemini)

### Web Search
- **Simple queries**: ~3-8 seconds
- **Complex research**: ~10-30 seconds
- **Fact-checking**: ~5-15 seconds per claim
- **Academic search**: ~15-45 seconds

### Combined Operations
- **File + Web analysis**: ~20-60 seconds
- **Comprehensive assessment**: ~1-3 minutes
- **Research verification**: ~30-90 seconds

---

## Troubleshooting

### MCP Server Issues

**"MCP servers not available"**:
```bash
# Check MCP server status
docker compose logs librechat | grep -i mcp

# Restart LibreChat
docker compose restart librechat

# Verify MCP configuration
docker compose exec librechat cat /app/librechat.yaml | grep -A 10 mcpServers
```

**"Cannot access files"**:
```bash
# Check file permissions
ls -la demos/02-mcp-integration/sample-submissions/

# Verify mount points
docker compose exec librechat ls -la /app/demos/

# Check file paths in prompts
```

**"Web search not working"**:
```bash
# Test internet connectivity
docker compose exec librechat curl -I https://www.google.com

# Check MCP web search server
docker compose logs librechat | grep -i "web-search"

# Verify search functionality
```

### Performance Issues

**Slow file processing**:
- Use smaller files for testing
- Check available system resources
- Consider file format compatibility
- Optimize file organization

**Web search timeouts**:
- Increase timeout values in configuration
- Check network connectivity
- Use more specific search queries
- Implement result caching

---

## Next Steps

### Immediate
1. **Test with Real Files**: Upload actual student assignments
2. **Customize Tools**: Configure MCP servers for your specific needs
3. **Train Faculty**: Show professors how to use MCP capabilities

### Short-term
1. **Custom MCP Servers**: Develop institution-specific tools
2. **Integration**: Connect with LMS and grading systems
3. **Workflow Automation**: Create standard assessment procedures

### Long-term
1. **Advanced Analytics**: Implement learning analytics MCP servers
2. **Specialized Tools**: Subject-specific assessment capabilities
3. **AI Agents**: Combine MCP with specialized educational agents

---

## Demo Report Template

**Date**: _______________  
**Demonstrator**: _______________  
**Audience**: _______________

### MCP Functionality
**Filesystem Access**:
- File reading: Working / Issues
- Code analysis quality (1-10): _____
- Essay grading accuracy (1-10): _____

**Web Search Integration**:
- Current info retrieval: Working / Issues
- Fact-checking accuracy (1-10): _____
- Source quality (1-10): _____

### Educational Value
**Most Useful Features**:
1. _______________
2. _______________
3. _______________

**Potential Applications**:
- Computer Science: _______________
- Writing Courses: _______________
- Research Projects: _______________
- Other Subjects: _______________

### Technical Performance
- Response times: Fast / Acceptable / Slow
- Accuracy of analysis: High / Medium / Low
- Ease of use: Easy / Moderate / Difficult

### Recommendations
- [ ] **Implement for pilot program**
- [ ] **Needs more development**
- [ ] **Focus on specific use cases**

**Priority applications**: _______________

---

## Congratulations!

You've successfully demonstrated LibreChat's MCP integration capabilities. This shows how AI can be extended beyond simple chat to become a comprehensive educational assessment platform.

Key Achievements:
- File analysis for automated grading
- Web search for research and fact-checking
- Combined capabilities for comprehensive assessment
- Educational workflows demonstrated

Ready for more? Try [Demo 03: Artifacts Showcase](../03-artifacts-showcase/) to see interactive content generation!

Built for Education, Powered by Free AI
