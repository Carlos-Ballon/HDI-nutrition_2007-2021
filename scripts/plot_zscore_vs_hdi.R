# Fonts
# font_add_google("Lato", "Lato")
# font_add_google("Zilla Slab", "Zilla Slab")
# showtext_auto()
font_import(pattern = "Lato", prompt = FALSE)
font_import(pattern = "Syne", prompt = FALSE)

# Plot
plot_zscore_vs_hdi <- function(data, yvar, xvar = z_hdi, color_var = pais, xlab = NULL, ylab = NULL) {
  
  yvar <- rlang::enquo(yvar)
  xvar <- rlang::enquo(xvar)
  color_var <- rlang::enquo(color_var)
  
  ggplot(data, aes(x = !!xvar, y = !!yvar, color = !!color_var)) +
    
    # Countries
    geom_point(size = 3, alpha = 0.6, shape = 19) +
    
    # Linear regression
    geom_smooth(
      aes(x = !!xvar, y = !!yvar, linetype = "Lineal"),
      inherit.aes = FALSE, 
      method = "lm", 
      formula = y ~ x, 
      se = FALSE,
      color = "#00468bff", 
      linewidth = 1
    ) +
    
    # Natural Cubic Splines Regression  
    geom_smooth(
      aes(x = !!xvar, y = !!yvar, linetype = "Non-linear"),
      inherit.aes = FALSE,
      method = "lm", 
      formula = y ~ splines::ns(x, 2), 
      se = FALSE,
      color = "#ED0000FF", 
      linewidth = 1
    ) +
    
    # Z-Score breaks
    scale_y_continuous(breaks = seq(-3, 3, 1)) +
    scale_x_continuous(breaks = seq(-3, 3, 1)) +
    
    # Theme and colors
    ggpubr::theme_pubclean(base_size = 14, base_family = "Lato") +
    ggsci::scale_color_frontiers() +
    scale_linetype_manual(
      name = "Models",
      values = c("Lineal" = "solid", "Non-linear" = "solid")
    ) +
    theme(
      legend.position = "bottom",
      legend.text = element_text(color = "black", size = 14),
      legend.title = element_blank(),
      axis.title.x = if (!is.null(xlab)) element_text(color = "black", size = 18, margin = margin(t = 15)) else element_blank(),
      axis.title.y = if (!is.null(ylab)) element_text(color = "black", size = 18) else element_blank(),
      axis.line = element_line(colour = "black"),
      axis.text = element_text(color = "black", size = 14),
      panel.grid.major.x = element_line(color = "grey70", linetype = 2),
      panel.grid.major.y = element_line(color = "grey70", linetype = 2),
      plot.margin = margin(l = 20, r = 15, t = 15)
    ) +
    labs(x = xlab, y = ylab) +
    guides(
      color = guide_legend(nrow = 1, override.aes = list(size = 4)),
      linetype = guide_legend(nrow = 1, override.aes = list(
        size = 4, 
        color = c("#00468bff", "#ED0000FF")
      ))
    )
}

