/*
 * Copyright 2011-2023 Branimir Karadzic. All rights reserved.
 * License: https://github.com/bkaradzic/bgfx/blob/master/LICENSE
 */

#ifndef NANOVG_BGFX_H_HEADER_GUARD
#define NANOVG_BGFX_H_HEADER_GUARD

// #include <bgfx/c99/bgfx.h>

#ifdef __cplusplus
extern "C" {
#endif

struct NVGcontext;

// struct NVGLUframebuffer {
//   struct NVGcontext *ctx;
//   bgfx_frame_buffer_handle_t handle;
//   int image;
//   bgfx_view_id_t viewId;
// };

// These are additional flags on top of NVGimageFlags.
// enum NVGimageFlagsGL {
//   NVG_IMAGE_NODELETE = 1 << 16, // Do not delete GL texture handle.
// };

///
// struct NVGcontext *nvgCreate(int32_t _edgeaa, bgfx_view_id_t _viewId);
struct NVGcontext *nvgCreate(int _edgeaa, unsigned short _viewId);

///
void nvgDelete(struct NVGcontext *_ctx);

// ///
// void nvgSetViewId(struct NVGcontext *_ctx, bgfx_view_id_t _viewId);

// ///
// uint16_t nvgGetViewId(struct NVGcontext *_ctx);

// Helper functions to create bgfx framebuffer to render to.
// Example:
//		float scale = 2;
//		NVGLUframebuffer* fb = nvgluCreateFramebuffer(ctx, 100 * scale,
// 100 * scale, 0); 		nvgluSetViewFramebuffer(VIEW_ID, fb);
//		nvgluBindFramebuffer(fb);
//		nvgBeginFrame(ctx, 100, 100, scale);
//		// renders anything offscreen
//		nvgEndFrame(ctx);
//		nvgluBindFramebuffer(NULL);
//
//		// Pastes the framebuffer rendering.
//		nvgBeginFrame(ctx, 1024, 768, scale);
//		NVGpaint paint = nvgImagePattern(ctx, 0, 0, 100, 100, 0,
// fb->image, 1); 		nvgBeginPath(ctx); 		nvgRect(ctx, 0,
// 0, 100, 100); 		nvgFillPaint(ctx, paint); nvgFill(ctx);
// nvgEndFrame(ctx);

// ///
// struct NVGLUframebuffer *nvgluCreateFramebuffer(struct NVGcontext *_ctx,
//                                                 int32_t _width, int32_t
//                                                 _height, int32_t _imageFlags,
//                                                 bgfx_view_id_t _viewId);

// ///
// struct NVGLUframebuffer *nvgluCreateFramebuffer(struct NVGcontext *_ctx,
//                                                 int32_t _width, int32_t
//                                                 _height, int32_t
//                                                 _imageFlags);

// ///
// struct NVGLUframebuffer *nvgluCreateFramebuffer(struct NVGcontext *_ctx,
//                                                 int32_t _imageFlags,
//                                                 bgfx_view_id_t _viewId);

// ///
// struct NVGLUframebuffer *nvgluCreateFramebuffer(struct NVGcontext *_ctx,
//                                                 int32_t _imageFlags);

// ///
// void nvgluBindFramebuffer(struct NVGLUframebuffer *_framebuffer);

// ///
// void nvgluDeleteFramebuffer(struct NVGLUframebuffer *_framebuffer);

// ///
// void nvgluSetViewFramebuffer(bgfx_view_id_t _viewId,
//                              struct NVGLUframebuffer *_framebuffer);

// ///
// int nvgCreateBgfxTexture(struct NVGcontext *_ctx, bgfx_texture_handle_t _id,
//                          int _width, int _height, int _flags);

#ifdef __cplusplus
}
#endif

#endif // NANOVG_BGFX_H_HEADER_GUARD
