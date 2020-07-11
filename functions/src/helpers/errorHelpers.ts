export const logReturnFactory = <T>(returnValue: T) => {
  return (err: any) => {
    console.log(err);
    return returnValue;
  };
};
