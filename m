Return-Path: <kernel-janitors+bounces-3870-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EAC903B3D
	for <lists+kernel-janitors@lfdr.de>; Tue, 11 Jun 2024 13:58:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23923288A30
	for <lists+kernel-janitors@lfdr.de>; Tue, 11 Jun 2024 11:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 000E417BB32;
	Tue, 11 Jun 2024 11:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LTXKZQhE"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA94F17B513
	for <kernel-janitors@vger.kernel.org>; Tue, 11 Jun 2024 11:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718107085; cv=none; b=TGLRvvPoqBwh7DXKvf2b/Smut6CVQL/6OJCzTizKxhWhuiuU2lAkCI9aPBc6un5xfjsiFPauvTkFZ9WHtHzVusBzZHAkG+f6BJXUGkNvrL1OWp8gDk5q0aJHHxzYSihzGfCop+o4b4roZRyRW47UotwI8u4ZS6iy0bk/aQqM6KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718107085; c=relaxed/simple;
	bh=KQOQMNe/0O2p5NcAx9Wr8YU3xBI8taSDf2dxsX8eN+U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QWpsv4bKSzlZ/mz8F7N/Nc/fnzYU4D3DFaH4aZ0yKj3YtAghIGYWUcUwaZM4Kqj9R3/IyCElDT8JSL2W3ZbgaRqzVNAgKT9EkOfiC70Vr02qgesHiPbUej35OZUbR7GsyTYTZ/ZcCQKWY2h8wptQHnnCmsf+yuu0fjPQv30moK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LTXKZQhE; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a6267778b3aso553650766b.3
        for <kernel-janitors@vger.kernel.org>; Tue, 11 Jun 2024 04:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718107082; x=1718711882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8km0fCrQgO57gFXBsXFIYcrjuKczDYZLAASbYW83aek=;
        b=LTXKZQhECbbfKv/qkZCqUXiwri9YSZmnMzOpcOcBiGAxiX//EtvEs8CaahYh4Hlavk
         NdJVYFn6ZRh0wfmkpsI6XgV/oHsQNI87gpiReGDii1AFcIfO2QLPkZTdS92ChNjXUKHU
         VbVzQ3dHKh8wgXN/OQaLpOKMxiykQBSrW+rDA5aXq7GXDxfnRe1IUBwQlc6F+73JBngb
         CMdw5KdbQU85kcTzttxuSsCrYRNZbCH2dpkjXcB7Yy2x5ZqQSXjz5Z6KMSUr0cRUJpVk
         650bUQFLGSG64x653XGcQwCzDwR6azGKRzbHW9sjY+boMPUAGvTZexbMm9avCX7Gkzle
         uNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718107082; x=1718711882;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8km0fCrQgO57gFXBsXFIYcrjuKczDYZLAASbYW83aek=;
        b=f0Azz325Wv6k1dEgLsRGWOHvZZSMIC6QxibrZj4/yJNyBjNsH5dV72Hfk3hu+D5z1u
         dDgLbc/XcoCJK//A57c3oRJtNWbdJUgMXLRq+paXSshx8a92uvy36aO+oGFjfjOIxYZf
         AYgW2EayQCIZdFWtELJZPpSKc7ujeGkC8a9xLvcxA3JxOwHHMpZTt76UGO72d9VRsFv3
         c0gsSvYlvuINO43mLiraA0iJQyLymd2KW4bxVFDHyyhGySBEYouhxVHD7wFEMdR0Pplb
         NVAZd/D34U8O1HOmQg0zgrWgwPaVxmb2YCjUSKbcSseBXx0k2igbr2TiStcIoNJrIs45
         WqYg==
X-Forwarded-Encrypted: i=1; AJvYcCXbiEoOs+GdbvxvuhxNL2XPR/XWpY1hKRHA6bRCdrzP1Tg1bEUKFBY/x9vkUPkAP/xWbJIjhHfkAu357lApq7KwzAzu78JwHIi4czCU9Cw5
X-Gm-Message-State: AOJu0YxW58S3x5GdUBnZ/DvLcIEQPKaj90Ku/OIwdS/fdHYOE2MP9T3d
	PHLuwyA2GPfBjlNGvpfOdIIpZ5Aza3NbbJgMMGFKglTjHwNFIXJ8Bl+YsWL7fRA=
X-Google-Smtp-Source: AGHT+IFE/E3oXsA/j5Sw46isYeAbfSwDcm+QTBQfzlRN7+BbqOoeqoLghf4L6f7cDyPU3Yb2H/A/fA==
X-Received: by 2002:a17:906:4eca:b0:a6e:f75f:be04 with SMTP id a640c23a62f3a-a6ef75fc386mr549563966b.38.1718107082022;
        Tue, 11 Jun 2024 04:58:02 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57c6aa014c1sm6226784a12.41.2024.06.11.04.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 04:58:01 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Amol Maheshwari <amahesh@qti.qualcomm.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@quicinc.com, kernel-janitors@vger.kernel.org
In-Reply-To: <20240603-md-misc-fastrpc-v1-1-6e6d73d08315@quicinc.com>
References: <20240603-md-misc-fastrpc-v1-1-6e6d73d08315@quicinc.com>
Subject: Re: (subset) [PATCH] misc: fastrpc: add missing
 MODULE_DESCRIPTION() macro
Message-Id: <171810708104.74168.2910983617658418174.b4-ty@linaro.org>
Date: Tue, 11 Jun 2024 12:58:01 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Mon, 03 Jun 2024 12:58:08 -0700, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/misc/fastrpc.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> 

Applied, thanks!

[1/1] misc: fastrpc: add missing MODULE_DESCRIPTION() macro
      commit: 6814f03445b30f6a136ff043cb54c0a86e3de982

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


