from abc import ABC

from mrjob.job import MRJob


class Noise(MRJob, ABC):

    def mapper(self, _, line):
        (Unnamed, business_id, name, address, city, state,
         postal_code, latitude, longitude, stars, review_count,
         is_open, attributes, categories, hours) = line.split(',')

        yield dict(attributes), dict(categories)

    def reducer(self, attr, cat):
        noise = []
        for i, _ in zip(attr, cat):
            if i:
                for k in i.keys():
                    if k == 'NoiseLevel':
                        noise.append(i[k])

        for n in noise:
            num = noise.count(n)
            yield n, num


if __name__ == '__main__':
    Noise.run()