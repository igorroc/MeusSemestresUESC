struct node {
    /* informação associada a cada nó */
};
struct arc {
    int adj;
    /* informação associada a cada arco */
};
struct graph {
    struct node nodes[MAXNODES];
    struct arc arcs[MAXNODES][MAXNODES];
};