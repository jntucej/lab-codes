/*
 * 4. Distance Vector Routing (SAS)
 *
 * HOW IT WORKS (one line):
 *  Each router keeps a table of (distance, next-hop) for every destination.
 *  Routers exchange tables with neighbors and apply the Bellman-Ford equation:
 *      dist[i][j] = min over k of ( cost[i][k] + dist[k][j] )
 *  Repeat until no table changes (convergence).
 *
 * THE "count" VARIABLE:
 *  Counts how many entries changed during one full exchange pass.
 *  If count == 0, every router's table has converged.
 */

#include <stdio.h>

struct node {
    unsigned dist[20], from[20];
} rt[20];

int main() {
    int dmat[20][20], n, count = 0;

    printf("Enter the number of nodes: ");
    scanf("%d", &n);

    printf("Enter the cost matrix:\n");
    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++) {
            scanf("%d", &dmat[i][j]);
            rt[i].dist[j] = dmat[i][j];    /* initial: direct cost */
            rt[i].from[j] = j;            /* initial: direct neighbor */
        }

    /* Keep exchanging until no table changes */
    do {
        count = 0;
        for (int i = 0; i < n; i++)          /* each router */
            for (int j = 0; j < n; j++)      /* each destination */
                for (int k = 0; k < n; k++)  /* each neighbor k */
                    if (rt[i].dist[j] > dmat[i][k] + rt[k].dist[j]) {
                        rt[i].dist[j] = dmat[i][k] + rt[k].dist[j];
                        rt[i].from[j] = k;
                        count++;
                    }
    } while (count != 0);

    for (int i = 0; i < n; i++) {
        printf("\nState value for router %d is\n", i + 1);
        for (int j = 0; j < n; j++)
            printf("node %d via %d Distance %d\n",
                   j + 1, rt[i].from[j] + 1, rt[i].dist[j]);
    }
    return 0;
}

/*
 * SAMPLE RUN (cost matrix):
 *   0  3  5  99
 *   3  0  99  1
 *   5  99  0  2
 *   99  1  2  0
 *
 * Router 1:  to node2 via 2 dist 3, to node3 via 3 dist 5, to node4 via 2 dist 4
 * Router 2:  to node3 via 4 dist 3, to node4 via 4 dist 1
 * ... etc.
 */
