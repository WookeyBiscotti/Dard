// #include "nanovg_bgfx.h"
// #include "nanovg_bgfx.hpp"

// NVGcontext *nvgCreate(int32_t _edgeaa, bgfx_view_id_t _viewId) {
//     return nvgCreate()
// }

// ///
// void nvgDelete(NVGcontext *_ctx);

// ///
// void nvgSetViewId(NVGcontext *_ctx, bgfx_view_id_t _viewId);

// ///
// uint16_t nvgGetViewId(struct NVGcontext *_ctx);

// // Helper functions to create bgfx framebuffer to render to.
// // Example:
// //		float scale = 2;
// //		NVGLUframebuffer* fb = nvgluCreateFramebuffer(ctx, 100 * scale,
// // 100 * scale, 0); 		nvgluSetViewFramebuffer(VIEW_ID, fb);
// //		nvgluBindFramebuffer(fb);
// //		nvgBeginFrame(ctx, 100, 100, scale);
// //		// renders anything offscreen
// //		nvgEndFrame(ctx);
// //		nvgluBindFramebuffer(NULL);
// //
// //		// Pastes the framebuffer rendering.
// //		nvgBeginFrame(ctx, 1024, 768, scale);
// //		NVGpaint paint = nvgImagePattern(ctx, 0, 0, 100, 100, 0,
// // fb->image, 1); 		nvgBeginPath(ctx); 		nvgRect(ctx, 0,
// // 0, 100, 100); 		nvgFillPaint(ctx, paint); nvgFill(ctx);
// // nvgEndFrame(ctx);

// ///
// NVGLUframebuffer *nvgluCreateFramebuffer(NVGcontext *_ctx, int32_t _width,
//                                          int32_t _height, int32_t _imageFlags,
//                                          bgfx_view_id_t _viewId);

// ///
// NVGLUframebuffer *nvgluCreateFramebuffer(NVGcontext *_ctx, int32_t _width,
//                                          int32_t _height, int32_t _imageFlags);

// ///
// NVGLUframebuffer *nvgluCreateFramebuffer(NVGcontext *_ctx, int32_t _imageFlags,
//                                          bgfx_view_id_t _viewId);

// ///
// NVGLUframebuffer *nvgluCreateFramebuffer(NVGcontext *_ctx, int32_t _imageFlags);

// ///
// void nvgluBindFramebuffer(NVGLUframebuffer *_framebuffer);

// ///
// void nvgluDeleteFramebuffer(NVGLUframebuffer *_framebuffer);

// ///
// void nvgluSetViewFramebuffer(bgfx_view_id_t _viewId,
//                              NVGLUframebuffer *_framebuffer);

// ///
// int nvgCreateBgfxTexture(struct NVGcontext *_ctx, bgfx_texture_handle_t _id,
//                          int _width, int _height, int _flags);
