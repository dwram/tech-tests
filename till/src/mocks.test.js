import {cleanup} from "@testing-library/react";

function sum(x, y) {
    return x + y;
}

afterEach(cleanup)
describe('Mock tests', () => {
   test('2+3 returns five', () => {
      const sum = jest.fn((x,y) => x + y)
      expect(sum(2,3)).toBe(5);
   });
});