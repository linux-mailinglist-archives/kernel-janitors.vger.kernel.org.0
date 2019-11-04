Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81555EE4A8
	for <lists+kernel-janitors@lfdr.de>; Mon,  4 Nov 2019 17:29:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728957AbfKDQ3o (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 4 Nov 2019 11:29:44 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44291 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728336AbfKDQ3n (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 4 Nov 2019 11:29:43 -0500
Received: by mail-pg1-f196.google.com with SMTP id f19so2498487pgk.11
        for <kernel-janitors@vger.kernel.org>; Mon, 04 Nov 2019 08:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=yDJzuHaFrgDE1koaL4VlaTE201wYefd3OwCvYO8ysEU=;
        b=PfsYHrTRK/P8+qRQn8NZ79YZ2CjKL1sum8VuGgpn8h9BLbBW7CZql+HC8UWdA7p2+L
         cEyGOwBWZaqjUkm/0Z6U9XtvNhIbzziY8UCWrXTGhoLQf+h7WUIiT0sV91wgiucBFShk
         jqkhbQqemKwmthXRxZXjY0dY99BQsVkF6mDP112JH0PCgTrDkL/OE8I/V8DWscn8eEVy
         9YCihiMSS72wFW5oL56XBsUVgjtU0b+LdyvpIHLSPsPnOx6KsaQ+HaexF8gAdo7tcHub
         EKZqSzm8zCniN6MaVWfVHf0ValeVg+vB1PqjdGzIIU00morL98KbP1Wtww6fQ+SahL2c
         VPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=yDJzuHaFrgDE1koaL4VlaTE201wYefd3OwCvYO8ysEU=;
        b=WvJw9nQ4Vy46DiD1SwVSC4cSnav56Q/3qlwTJbSOuc8icptS8wubZktwmAMKWUMEKL
         t6IXtARCYAy65zsNTNh3A/dpmC5vy0DCavgvHWhd/YB8ao+U3H3fewa4q6qI7c0HWeel
         7njookzjdJJrlj6gHlaPMeGyj75XRI3WvPuytQqWBUdVtMDPoSejQOjA3/+SWn/uvTRV
         pHquJwTPMAYg3tb4KoF2pViOGv5abHhHS7OlvCpMV4c+1u8Kw2A+H+oM53purpZVGXIC
         F7zCfaYK8RO2pHOPQdW6Jk4sE7Ia9AldfMo8mJolo9Ci6+zb3Zm6rBHXUEdVeA4Xs+lA
         jT9w==
X-Gm-Message-State: APjAAAUVmm62Gp691db49RH/HQlpM8CweAVBWSaYIVz29Ug62a1WzaC0
        KYZmmQf014v0/rmkNbCb7gV8+A==
X-Google-Smtp-Source: APXvYqwpiP2aKfBZwiONDK30yJFr79JwBMg1oHg1YfDywuN4GIzwpS1bI4ZA7pGHqCSOKyoITCVseg==
X-Received: by 2002:a17:90a:5d0f:: with SMTP id s15mr36068769pji.90.1572884982928;
        Mon, 04 Nov 2019 08:29:42 -0800 (PST)
Received: from cakuba.netronome.com ([2601:646:8e00:e18::4])
        by smtp.gmail.com with ESMTPSA id 6sm17328038pfz.156.2019.11.04.08.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 08:29:42 -0800 (PST)
Date:   Mon, 4 Nov 2019 08:29:38 -0800
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        Andrii Nakryiko <andriin@fb.com>, netdev@vger.kernel.org,
        bpf@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH bpf] bpf: offload: unlock on error in
 bpf_offload_dev_create()
Message-ID: <20191104082938.351c1f07@cakuba.netronome.com>
In-Reply-To: <20191104091536.GB31509@mwanda>
References: <20191104091536.GB31509@mwanda>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 4 Nov 2019 12:15:36 +0300, Dan Carpenter wrote:
> We need to drop the bpf_devs_lock on error before returning.
> 
> Fixes: 9fd7c5559165 ("bpf: offload: aggregate offloads per-device")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Jakub Kicinski <jakub.kicinski@netronome.com>
