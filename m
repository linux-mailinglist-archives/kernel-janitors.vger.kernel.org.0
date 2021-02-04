Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1618030F63C
	for <lists+kernel-janitors@lfdr.de>; Thu,  4 Feb 2021 16:27:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237346AbhBDP1S (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 4 Feb 2021 10:27:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237313AbhBDPZJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 4 Feb 2021 10:25:09 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC2F3C06178B
        for <kernel-janitors@vger.kernel.org>; Thu,  4 Feb 2021 07:24:28 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id y187so3328401wmd.3
        for <kernel-janitors@vger.kernel.org>; Thu, 04 Feb 2021 07:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2d6JxtJOaxpmDK1rvlDktYLwQC3lg/WsDdaZFNHm0QY=;
        b=CS+l9f4lcjQCD8lvkOFJ7F2ir8HDh268KpXOnkoYr9gE61e9FZYgQ0Cua27KtyefIr
         Cax9XopiM/Py5GmEzOBl6PzaL+BDr17+QouJZIUhJz4ZPljaiWRa32HyK8Psrhnq/jRO
         KXNpzCWUE6/sV0KVcfpAY64TWGdKEJ4dQVBvCIFiBYbj0XFJXxtxwHdFr0a/Pe7VyExD
         nKTqvvrmXI/BAS0Tbjq/v+iaSGc8BjsEfqzi6QjryJDeqsE7JTbMYxqnjpaJoVTRF4YB
         feD4fLtSYCsG1C4wiBZKdvmC529xYxeUZky9pfTV5tAQrEWBH1fLjHetH1uChLcH9hIY
         kxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2d6JxtJOaxpmDK1rvlDktYLwQC3lg/WsDdaZFNHm0QY=;
        b=Px19YyElgTYA4zUs5m9trwpwG0wSo+3WhilgbBVzxFq4aLa4Q4nUMvaNecaBTZ5JT/
         o3ifP1j7ingW+Cbu8ZpUPPwLhLHsz0Ac4+fYqx9VHvmjh1AC3tbHhU+lux7usU1Vw+nR
         sIQ1q6CnVY0kuwqUS0NLGejkYX4bUmlkURJ0Cf3acnozY4bIGsiT/K6SL7AHJVoH4KVo
         xF0w+HPoS9329zH/9pI0ndlvJbTLX4hQ7cc48nBnSVDko9H1ZXgoMYteDxTrUoAnEK+K
         oRgZEr2Msil4xY9QJjan0ZnlBxXvNVOHjRHDNzNw3F6PywF/OHyn8rTtJfRd9S3Tfcl/
         vsSg==
X-Gm-Message-State: AOAM531OIWRcTlk/UjuzQoxSl+6U9CHlfy//lAj6OGdgXfIJZK6VMsIy
        w7a09PXvHh89Tjgkvrcy3D1UGA==
X-Google-Smtp-Source: ABdhPJzK+8hQQQd0W7CJq91rYRYdkogA/OEcRNJrNNUYDyrb4ShwlZGlpUWjPbji1ZjJoPZYHtjbFQ==
X-Received: by 2002:a1c:96d7:: with SMTP id y206mr30310wmd.9.1612452267459;
        Thu, 04 Feb 2021 07:24:27 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id k6sm8892749wro.27.2021.02.04.07.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 07:24:26 -0800 (PST)
Date:   Thu, 4 Feb 2021 15:24:24 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Jason Wessel <jason.wessel@windriver.com>,
        Douglas Anderson <dianders@chromium.org>,
        kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] kgdb: rectify kernel-doc for kgdb_unregister_io_module()
Message-ID: <20210204152424.wrq3bgmq77fssjwj@maple.lan>
References: <20210125144847.21896-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125144847.21896-1-lukas.bulwahn@gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jan 25, 2021 at 03:48:47PM +0100, Lukas Bulwahn wrote:
> The command 'find ./kernel/debug/ | xargs ./scripts/kernel-doc -none'
> reported a typo in the kernel-doc of kgdb_unregister_io_module().
> 
> Rectify the kernel-doc, such that no issues remain for ./kernel/debug/.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Applied. Thanks.
