Return-Path: <kernel-janitors+bounces-623-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7510E80AE6B
	for <lists+kernel-janitors@lfdr.de>; Fri,  8 Dec 2023 21:59:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 140EFB20B93
	for <lists+kernel-janitors@lfdr.de>; Fri,  8 Dec 2023 20:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A1294EB27;
	Fri,  8 Dec 2023 20:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nuI8q0Tv"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A2DE1738
	for <kernel-janitors@vger.kernel.org>; Fri,  8 Dec 2023 12:59:08 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5c664652339so1956383a12.1
        for <kernel-janitors@vger.kernel.org>; Fri, 08 Dec 2023 12:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702069148; x=1702673948; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4tDY+el5yb1E7vibUCjRLXcZ8qga+f4zfjehHC1F09k=;
        b=nuI8q0Tv3MyVrTJvWoYR48vQspiRLC+1Udu/8M1DFXgVLac+IsnGZnqZwbGPW/S6tN
         7fL2dUHiKyNIjwaEuTvlJlgkLHki3cQmVHH+8EaWBvZIVZf74vIwaqbk8Klq1cBDTAle
         YBUhbGCuSFOpF2gDK64trTzc7BQtONubSjrJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702069148; x=1702673948;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tDY+el5yb1E7vibUCjRLXcZ8qga+f4zfjehHC1F09k=;
        b=aRE9nV4UAR4uec4i0tcOS7QHO+G3nakcozI45uux4WkW8gUWprwP1/OP8u0kOYTybT
         +9tH0msgns2KaScmlj6y5swCt8fY5xKiNgyeQG16ENiN6BPPgFwk6gl3yLcWP+7kz65l
         yNaAyY6jUSZrEGz3SAcPS0XdPVWgYqMIU0i9rogf8M5FtvHczOogZUOsubPWoEkZUyRU
         +SbxpICZGul3g+KAkKZWpyc1UIFHTNH4QRdoC5jLnGY+zEw6+5prv28CU3pWcUhkFkI3
         8c4A0JxQoGoyEsQ0RXLn/3RvLD3R1YciWZBKFfJW6KdkC1MRCoFw1d1kF2a69CymRhrN
         Iq/Q==
X-Gm-Message-State: AOJu0YwoPeJ5eCcLiZhuGQOX0STVLY9zq/vrVxAGtzq+wjyR48gF547O
	wFro7dAo5nsp/+OYZc831ebSVA==
X-Google-Smtp-Source: AGHT+IHC0xhEEwf9AQh+iBNpO2ZO5pX3d5ZBv46D7LnSDAXnR6AD1N3JqwDjUZmr03O1IpKIMJtjAw==
X-Received: by 2002:a05:6a21:18c:b0:190:6bc:adf0 with SMTP id le12-20020a056a21018c00b0019006bcadf0mr726883pzb.50.1702069148008;
        Fri, 08 Dec 2023 12:59:08 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id o15-20020a056a0015cf00b006ce9fb084f4sm2011817pfu.101.2023.12.08.12.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 12:59:07 -0800 (PST)
Date: Fri, 8 Dec 2023 12:59:07 -0800
From: Kees Cook <keescook@chromium.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Bryan Tan <bryantan@vmware.com>, Vishnu Dasa <vdasa@vmware.com>,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] VMCI: Remove handle_arr_calc_size()
Message-ID: <202312081258.85F7D88E@keescook>
References: <adf0c48a57d911be5509688614d2e00694ff57eb.1702068153.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adf0c48a57d911be5509688614d2e00694ff57eb.1702068153.git.christophe.jaillet@wanadoo.fr>

On Fri, Dec 08, 2023 at 09:46:09PM +0100, Christophe JAILLET wrote:
> Use struct_size() instead of handle_arr_calc_size().
> This is much more conventionnal.
> 
> Suggested-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Looks good. And since capacity in u32, there's no need for size_add().

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

