import React from 'react';
import {cleanup, render} from '@testing-library/react';
import App from './App';

afterEach(cleanup)
test('renders shop information', () => {
  const { getByText } = render(<App />);
  const titleElement = getByText('Till Receipt');
  const addressElement = getByText('123 Lakeside Way')
  const numberElement = getByText('16503600708')
  expect(titleElement).toBeInTheDocument();
  expect(addressElement).toBeInTheDocument();
  expect(numberElement).toBeInTheDocument();
});



