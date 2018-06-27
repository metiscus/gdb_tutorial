#ifndef SUPPORT_H_INCLUDED
#define SUPPORT_H_INCLUDED

#ifdef __cplusplus
extern "C"
#endif

#ifdef API_V1
extern float scaled_magnitude(float scale, float x, float y, float z);
#else
extern float scaled_magnitude(float scale, double x, double y, double z);
#endif

#ifdef __cplusplus
}
#endif

#endif // SUPPORT_H_INCLUDED
