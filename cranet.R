library(igraph)
g <- cranet::pkgnet("cran")

# Seed packages
seeds <- c("igraph", "network", "graph")

# Only dependence arcs
depnet <- delete.edges(g, E(g)[!(type %in% c("Depends", "Imports", "Suggests"))])

# list of package names
pkg_names <- ego(depnet, 1, V(depnet)[name %in% seeds], mode = "in")
sg <- simplify(induced_subgraph(depnet, unique(unlist(pkg_names))))
summary(sg)

d <- distances(sg, to = V(sg)[name %in% seeds], mode = "out")
x <- apply(d, 1, function(x) paste(sort(colnames(d)[x == min(x)]), collapse = "+"))
names(x) <- NULL
V(sg)$dep <- x
V(sg)$seed <- V(sg)$name %in% seeds
saveRDS(sg, "dependnet.RDS")
