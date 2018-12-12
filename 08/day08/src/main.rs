struct Node {
    children: Vec<Node>,
    metadata: Vec<usize>,
}

impl Node {
    fn value(&self) -> usize {
        if self.children.is_empty() {
            return self.metadata.iter().sum();
        }

        let mut result = 0;
        for data in self.metadata.iter() {
            if *data == 0 {
                continue;
            }

            let child_index = data - 1;
            if child_index > self.children.len() - 1 {
                continue;
            }

            let child = &self.children[child_index];
            result += child.value();
        }

        result
    }
}

#[derive(Debug)]
struct Context {
    index: usize,
    metadata_sum: usize,
}

impl Context {
    fn next(&mut self) -> usize {
        let current = self.index;
        self.index += 1;
        current
    }

    fn add_metadata(&mut self, number: usize) {
        self.metadata_sum += number;
    }
}
fn parse_tree(numbers: &[usize], context: &mut Context) -> Node {
    let num_child_nodes = numbers[context.next()];
    let num_metadata = numbers[context.next()];
    let mut children: Vec<Node> = Vec::new();
    let mut metadata: Vec<usize> = Vec::new();

    for _n in 0..num_child_nodes {
        children.push(parse_tree(numbers, context));
    }

    for _n in 0..num_metadata {
        let data = numbers[context.next()];
        metadata.push(data);
        context.add_metadata(data);
    }

    Node { children, metadata }
}
fn parse_numbers() -> Vec<usize> {
    include_str!("input")
        .split_whitespace()
        .map(|c| c.parse::<usize>().unwrap())
        .collect()
}

fn main() {
    let numbers = parse_numbers();
    let mut c = Context {
        index: 0,
        metadata_sum: 0,
    };
    let node = parse_tree(&numbers, &mut c);
    println!("{}", c.metadata_sum);
    println!("{}", node.value());
}
