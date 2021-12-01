def split_dataset(all, factor: int):
    def is_test(x, y):
        return x % factor == 0
    def is_train(x, y):
        return not is_test(x, y)
    recover = lambda x,y: y
    test_dataset = all.enumerate().filter(is_test).map(recover)
    train_dataset = all.enumerate().filter(is_train).map(recover)
    return train_dataset, test_dataset