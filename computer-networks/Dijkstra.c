/*
 * 3. Dijkstra's Shortest Path Algorithm (SAS)
 *
 * HOW IT WORKS (one line):
 *  Greedy: at each step, pick the closest unvisited node and
 *  relax its neighbors' distances. Repeat until all nodes are visited.
 *
 * WHY IT'S O(n^2) here:
 *  We scan all nodes to find the minimum each time, which is fine for
 *  the small matrices used in class.
 *
 * EDGE CASES TO REMEMBER:
 *  - 0 in the matrix means "no edge" (except the 0 on the diagonal for self).
 *  - The algorithm never updates the start node's distance (stays 0).
 */

#include <stdio.h>
#define INF 9999
#define MAX 10

void dijkstra(int G[MAX][MAX], int n, int start) {
    int cost[MAX][MAX], dist[MAX], pred[MAX];
    int visited[MAX] = {0}, count, mindist, next;

    /* Convert 0s (no edge) to INF */
    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++)
            cost[i][j] = (G[i][j] == 0 && i != j) ? INF : G[i][j];

    /* Initial distances: everything reachable directly from start */
    for (int i = 0; i < n; i++) {
        dist[i] = cost[start][i];
        pred[i] = start;
    }
    dist[start] = 0;
    visited[start] = 1;
    count = 1;

    /* Pick the closest unvisited node, relax its neighbors. */
    while (count < n - 1) {
        mindist = INF;
        for (int i = 0; i < n; i++)
            if (dist[i] < mindist && !visited[i]) {
                mindist = dist[i];
                next = i;
            }

        visited[next] = 1;

        for (int i = 0; i < n; i++)
            if (!visited[i] && mindist + cost[next][i] < dist[i]) {
                dist[i] = mindist + cost[next][i];
                pred[i] = next;
            }
        count++;
    }

    /* Print the shortest distance and path for every other node. */
    for (int i = 0; i < n; i++) {
        if (i == start) continue;
        printf("\nDistance of node %d = %d\npath = %d", i, dist[i], i);
        int j = i;
        do {
            j = pred[j];
            printf(" <- %d", j);
        } while (j != start);
    }
    printf("\n");
}

int main() {
    int G[MAX][MAX], n, u;

    printf("Enter no. of vertices: ");
    scanf("%d", &n);

    printf("Enter the adjacency matrix:\n");
    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++)
            scanf("%d", &G[i][j]);

    printf("Enter the starting node: ");
    scanf("%d", &u);

    dijkstra(G, n, u);
    return 0;
}

/*
 * SAMPLE RUN:
 * Enter no. of vertices: 5
 * Enter the adjacency matrix:
 * 0 10 0 30 100
 * 10 0 50 0 0
 * 0 50 0 20 10
 * 30 0 20 0 60
 * 100 0 10 60 0
 *
 * Enter the starting node: 0
 *
 * Distance of node 1 = 10    path = 1 <- 0
 * Distance of node 2 = 50    path = 2 <- 3 <- 0
 * Distance of node 3 = 30    path = 3 <- 0
 * Distance of node 4 = 60    path = 4 <- 2 <- 3 <- 0
 */
