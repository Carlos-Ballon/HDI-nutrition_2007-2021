# Human Development Index and Maternal-Child Nutrition Indicators in South America (2007–2021): An Ecological Study

## Summary
Despite economic development progress in South America, malnutrition, anemia, and childhood overweight remain pressing public health concerns. This ecological study assesses the correlation between the Human Development Index (HDI) and maternal-child nutrition indicators across ten South American countries from 2007 to 2021. The analysis includes anemia in children under five, pregnant women, and women of reproductive age, low birthweight, stunting, and childhood overweight.

## Methods
- **Design**: Ecological study using annual country-level data (2007–2021)
- **Sources**:
  - Nutrition indicators: [World Bank Open Data](https://databank.worldbank.org)
  - HDI: [UNDP Human Development Data Center](https://hdr.undp.org/data-center)
- **Indicators analyzed**:
  - Anemia in children (6–59 months), pregnant women, and women aged 15–49
  - Low birthweight
  - Stunting (height-for-age)
  - Childhood overweight
- **Statistical approach**:
  - Variables standardized using z-scores
  - Associations evaluated using:
    - Simple linear regression with clustered robust standard errors
    - Natural cubic splines (2 degrees of freedom) for non-linear patterns
  - All analyses conducted in RStudio

## 📈 Key Findings
- Significant inverse correlations between HDI and:
  - Anemia in children (ρ = –0.73), pregnant women (ρ = –0.71), and women of reproductive age (ρ = –0.89)
  - Childhood stunting (ρ = –0.56)
  - Low birthweight (ρ = –0.32, p = 0.002)
- Positive correlation between HDI and childhood overweight (ρ = 0.42)

## 📂 Repository Structure
HDI-nutrition_2007-2021/ ├── data/ # Raw and cleaned datasets ├── report_sources/ # Quarto document and figures │ └── IDH_LATAM.qmd # Main analysis and visualizations ├── R/ # Custom plotting and analysis functions ├── LICENSE # MIT License ├── README.md # Project overview └── .gitignore # Files excluded from version control

## 📄 Reproducibility
Clone the repository:
   ```bash
   git clone https://github.com/Carlos-Ballon/HDI-nutrition_2007-2021.git
   ```

📜 License
This project is licensed under the MIT License, allowing reuse with attribution.

🔍 Keywords
Development Indicators · Child Nutrition · Maternal Nutrition · Anemia · Overweight · South America
