class Palette {
    String name;
    // HashMap<Integer, Integer> colors; // color => weight
    ArrayList<ColorAttributes> colors; // color => weight
    int sumWeights;

    Palette() {
        colors = new ArrayList();
    }

    int size() {
        return colors.size();
    }

    void addColor(color c) {
        addColor(c, 1);
    }
    void addColor(color c, int weight) {
        colors.add( new ColorAttributes(c, weight) );
        normalizeWeights();
    }

    //get weighted random color
    color getColor() {
        float rnd = random(0, sumWeights);
        int currentOffset = 0;

        for ( ColorAttributes ca : colors ) {
            if ( rnd >= currentOffset && rnd < currentOffset + ca.weight ) {
                return ca.c;
            }

            currentOffset += ca.weight;
        }

        return color(255,0,0);
    }
    color getColor(int index) {
        return colors.get(index).c;
    }
    int getWeight( int index ) {
        return colors.get(index).weight;
    }
    float getWeightNormalized( int index ) {
        return colors.get(index).weight_normalized;
    }

    void normalizeWeights() {
        int maxWeight = 0;
        sumWeights = 0;

        for ( ColorAttributes ca : colors ) {
            if ( ca.weight > maxWeight ) {
                maxWeight = ca.weight;
            }

            sumWeights += ca.weight;
        }
        for ( ColorAttributes ca : colors ) {
            ca.weight_normalized = ca.weight * 1.0 / maxWeight;
        }
    }

    class ColorAttributes {
        color c;
        int weight;
        float weight_normalized;

        ColorAttributes(color c, int weight) {
            this.c = c;
            this.weight = weight;
        }
    }

}
