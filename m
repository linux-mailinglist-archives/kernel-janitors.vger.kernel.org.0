Return-Path: <kernel-janitors+bounces-867-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9202481E8BA
	for <lists+kernel-janitors@lfdr.de>; Tue, 26 Dec 2023 18:34:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B69921C213EA
	for <lists+kernel-janitors@lfdr.de>; Tue, 26 Dec 2023 17:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3740F4F8BC;
	Tue, 26 Dec 2023 17:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="bG5SFJ+b"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F264F885;
	Tue, 26 Dec 2023 17:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1703612004; x=1704216804; i=markus.elfring@web.de;
	bh=AuhcszHwHjGP9Acn89BVl5MLLXrMpR0aVvDveRatoik=;
	h=X-UI-Sender-Class:Date:To:Cc:From:Subject;
	b=bG5SFJ+bYfMdlpGE1cElBR5x1ijpvWLrkp6loXWkOoDmOoBXR0L53mMfHRgyu1v2
	 RrVDJqRD9hd6SX+zDKcIjeq77aF3DPWOogjNATijcmLPRbqn8bMO8tqucz3Ndz6JK
	 3IYE/RQgrbtSIijS9YSHaveF+38NNWHbb55wi6bgiOujYezqxmIITs3Vqh468A7mn
	 nCfwUKWtqf4aGEJ469/wks35vDHZ1oZ9TsfMmEcRlEAR8wj1VOGSIQpRP2vfwOANe
	 FMjGchaP6nVU2vm1F/G/kQCr3CN/Vstyf0BaFKXJVbDeP2K+cxsy5FRhzYVhmZLC8
	 2bkjcKS04SntJZ0o1g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MElV3-1rSOi72PWd-00GAan; Tue, 26
 Dec 2023 18:33:24 +0100
Message-ID: <189166d6-b76a-412a-bfcf-8ba14578a317@web.de>
Date: Tue, 26 Dec 2023 18:33:23 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] drm/vc4: Improve exception handling in vc4_validate_shader()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cqYAChBIlAwDCrpDesRT8Rcxu7TED955U2F15R9o1Lvz0JJr2FN
 uTKhH5RtR8P3nvpkDaA6FP3Z3AbzDluXJ9BYxHm7kZw+Wsl6SUnXMBcxkzReBqCZJWFYIZD
 +qKKAvP4dAuXEx9vhylypm1hlJdFyORz9GujswISk/AkMx8D9gvS82GVer/xy+zvDsQstS6
 U9M8IklMQJXMOEO59DWqA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:riS9T522lis=;57fc1AQoeN3UHWwK3JukaIDA71E
 oQuOiPMRZaDTXd0YVGVRZE+jXL0z8W6Bujhd0Q9IZ5uRgiedPwsqmvoKDuW37PaceJ6sRPCpG
 D9/G21S0YOVs/dUqtHHm1uaJKuVXYwqaiDSFeiu9dkywsjC2ZLP1iSSb00Gxfj35YRtH8R1k5
 HEY3Q5yST+1Y1SkCN92+dxUsOe8FkGKOUyUBAwN4bgfanTwcVZNjHwGy4IFAP1MZeHJQl/iv7
 OXuLrgiqUBG0OW+goOGFqXiZtFnQgpbXEIBFdoMJ93uTUetUCOQJLY9AqrUrqZjQeulaAzK8U
 4DKjLvIt908q0FbLhPffo4sOGBIMOmqvw9/ZM4W1pi6KrlqCCn69asLMstQcLwRoqcl3VcNyE
 wUIzIRa5SDAJ6/adhbIQJUu0vJLB8cYfmQFwz2XVOS8feiujbhaxruhTDUdWrQwAsibSunSWr
 EDOFHdlqumaLo0HoLHhH1fIrrmPw3gdn3q66xrqPxGMO7iT6azfn3+RgKVwOmk9Kd/2dXP5ml
 2/a3S9zs4LF7GDVYN7U9RDmY5GsIyCzxdBjaWwc2Fvs2hCmrHT5GDVNiU1eAIUZ3uEnrSR1hT
 QBf7vNXjqE7lO2qZEg8hANyH3xR2wJpL4RuZ+w9rDLT+96EIpWdsghb99ljNFB4uSOdVYqsAB
 PQyCLQcYNadkiurQTQ6rL5QnuKTBEznJ5Qh8+vjvSaiFvMtLksunegF9uF1/8f5T2fRmAOsKK
 QegbLA3QlO62jPozlTViu3vNSxP5mlJQDFqjqQld6cN8kHgXgifllQsotBPf6JGllZ7NToWOi
 L+gghKSFDbhLQGhWd64phzNSbrkSJYhTBaFvPZV9ywHCsjQPlVtIQyyM4hB5AjZpjwApcFhpp
 o/4ct1Fi/qDO81XIE9h8bIYrfK5uvPCE5AlHoZmF9ebd/Oc+Pr6pqwZjZ+dveKVLpv5YPZdjd
 qMj77gRzkgSUok4y7iyPo6/3pQ0=

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 26 Dec 2023 18:22:54 +0100

Memory releases were triggered during error handling only over
the label =E2=80=9Cfail=E2=80=9D.

1. Return directly after a call of the function =E2=80=9Ckcalloc=E2=80=9D =
failed
   at the beginning.

2. Reduce the data processing at the end to a required kfree() call order
   also by adjusting jump targets.

3. Delete an initialisation for the variable =E2=80=9Cvalidated_shader=E2=
=80=9D
   which became unnecessary with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/vc4/vc4_validate_shaders.c | 42 +++++++++++-----------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_validate_shaders.c b/drivers/gpu/drm/=
vc4/vc4_validate_shaders.c
index 9745f8810eca..d76787bb7d51 100644
=2D-- a/drivers/gpu/drm/vc4/vc4_validate_shaders.c
+++ b/drivers/gpu/drm/vc4/vc4_validate_shaders.c
@@ -783,7 +783,7 @@ vc4_validate_shader(struct drm_gem_dma_object *shader_=
obj)
 	int shader_end_ip =3D 0;
 	uint32_t last_thread_switch_ip =3D -3;
 	uint32_t ip;
-	struct vc4_validated_shader_info *validated_shader =3D NULL;
+	struct vc4_validated_shader_info *validated_shader;
 	struct vc4_shader_validation_state validation_state;

 	if (WARN_ON_ONCE(vc4->is_vc5))
@@ -799,14 +799,14 @@ vc4_validate_shader(struct drm_gem_dma_object *shade=
r_obj)
 		kcalloc(BITS_TO_LONGS(validation_state.max_ip),
 			sizeof(unsigned long), GFP_KERNEL);
 	if (!validation_state.branch_targets)
-		goto fail;
+		return NULL;

 	validated_shader =3D kcalloc(1, sizeof(*validated_shader), GFP_KERNEL);
 	if (!validated_shader)
-		goto fail;
+		goto free_targets;

 	if (!vc4_validate_branches(&validation_state))
-		goto fail;
+		goto free_shader;

 	for (ip =3D 0; ip < validation_state.max_ip; ip++) {
 		uint64_t inst =3D validation_state.shader[ip];
@@ -815,7 +815,7 @@ vc4_validate_shader(struct drm_gem_dma_object *shader_=
obj)
 		validation_state.ip =3D ip;

 		if (!vc4_handle_branch_target(&validation_state))
-			goto fail;
+			goto free_offsets;

 		if (ip =3D=3D last_thread_switch_ip + 3) {
 			/* Reset r0-r3 live clamp data */
@@ -842,12 +842,12 @@ vc4_validate_shader(struct drm_gem_dma_object *shade=
r_obj)
 			if (!check_instruction_writes(validated_shader,
 						      &validation_state)) {
 				DRM_DEBUG("Bad write at ip %d\n", ip);
-				goto fail;
+				goto free_offsets;
 			}

 			if (!check_instruction_reads(validated_shader,
 						     &validation_state))
-				goto fail;
+				goto free_offsets;

 			if (sig =3D=3D QPU_SIG_PROG_END) {
 				found_shader_end =3D true;
@@ -861,7 +861,7 @@ vc4_validate_shader(struct drm_gem_dma_object *shader_=
obj)
 				if (ip < last_thread_switch_ip + 3) {
 					DRM_DEBUG("Thread switch too soon after "
 						  "last switch at ip %d\n", ip);
-					goto fail;
+					goto free_offsets;
 				}
 				last_thread_switch_ip =3D ip;
 			}
@@ -872,26 +872,26 @@ vc4_validate_shader(struct drm_gem_dma_object *shade=
r_obj)
 			if (!check_instruction_writes(validated_shader,
 						      &validation_state)) {
 				DRM_DEBUG("Bad LOAD_IMM write at ip %d\n", ip);
-				goto fail;
+				goto free_offsets;
 			}
 			break;

 		case QPU_SIG_BRANCH:
 			if (!check_branch(inst, validated_shader,
 					  &validation_state, ip))
-				goto fail;
+				goto free_offsets;

 			if (ip < last_thread_switch_ip + 3) {
 				DRM_DEBUG("Branch in thread switch at ip %d",
 					  ip);
-				goto fail;
+				goto free_offsets;
 			}

 			break;
 		default:
 			DRM_DEBUG("Unsupported QPU signal %d at "
 				  "instruction %d\n", sig, ip);
-			goto fail;
+			goto free_offsets;
 		}

 		/* There are two delay slots after program end is signaled
@@ -905,7 +905,7 @@ vc4_validate_shader(struct drm_gem_dma_object *shader_=
obj)
 		DRM_DEBUG("shader failed to terminate before "
 			  "shader BO end at %zd\n",
 			  shader_obj->base.size);
-		goto fail;
+		goto free_offsets;
 	}

 	/* Might corrupt other thread */
@@ -913,7 +913,7 @@ vc4_validate_shader(struct drm_gem_dma_object *shader_=
obj)
 	    validation_state.all_registers_used) {
 		DRM_DEBUG("Shader uses threading, but uses the upper "
 			  "half of the registers, too\n");
-		goto fail;
+		goto free_offsets;
 	}

 	/* If we did a backwards branch and we haven't emitted a uniforms
@@ -927,7 +927,7 @@ vc4_validate_shader(struct drm_gem_dma_object *shader_=
obj)
 	 */
 	if (validation_state.needs_uniform_address_for_loop) {
 		if (!require_uniform_address_uniform(validated_shader))
-			goto fail;
+			goto free_offsets;
 		validated_shader->uniforms_size +=3D 4;
 	}

@@ -943,12 +943,12 @@ vc4_validate_shader(struct drm_gem_dma_object *shade=
r_obj)

 	return validated_shader;

-fail:
+free_offsets:
+	kfree(validated_shader->uniform_addr_offsets);
+	kfree(validated_shader->texture_samples);
+free_shader:
+	kfree(validated_shader);
+free_targets:
 	kfree(validation_state.branch_targets);
-	if (validated_shader) {
-		kfree(validated_shader->uniform_addr_offsets);
-		kfree(validated_shader->texture_samples);
-		kfree(validated_shader);
-	}
 	return NULL;
 }
=2D-
2.43.0


