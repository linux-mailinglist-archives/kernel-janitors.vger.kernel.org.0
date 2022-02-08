Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02A1A4ADA98
	for <lists+kernel-janitors@lfdr.de>; Tue,  8 Feb 2022 14:58:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377108AbiBHN6o (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 8 Feb 2022 08:58:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377097AbiBHN6o (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 8 Feb 2022 08:58:44 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E60AC03FECE
        for <kernel-janitors@vger.kernel.org>; Tue,  8 Feb 2022 05:58:39 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id n32so18975665pfv.11
        for <kernel-janitors@vger.kernel.org>; Tue, 08 Feb 2022 05:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:in-reply-to:references:subject:message-id:date
         :mime-version:content-transfer-encoding;
        bh=AIz4u6+J7TOpSAJ7umSJYy5QMznxsAdsbABH881qXOc=;
        b=QBvyg3iXYdPDog3Mjgdepp4ko2yHqMNCTbKR64iBX+RhYpRvyqc9bYuCOWzw/EZON6
         fb0YVocvKj0GOxIgoDaLhJIaeIILGeA4+sI/bA1V8NnQlV8QaVtH3DW1WrqJBffNWdY7
         sCD/aDoPpKxAgWDRoRQ4bnm1vQq+PsIXopIJNGuYb6jwVa8/gkzj39DQ5Y5uiy6x+EUP
         T8Pxoy7zPp43NUyECscPQ6QNWxDkoTH6CMPeNlHI1Z/zsPmehJiSSgCAxEAbWc0JgqZC
         E+QfZdAbsjlgqbEVdhhosJdoqYMnqw0y0qeOL/OicYv4pTxOO3O33DjWnwzI4g+wYUg3
         JGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=AIz4u6+J7TOpSAJ7umSJYy5QMznxsAdsbABH881qXOc=;
        b=RxnjuGmTZGl6nh+5L8SYNp0MWlnVnoguBIDbqAhYmCp05RGP+2KPXTdVbvegcu4ZON
         iNU+u22xBxf2Cn/7J+ZNIzS6I0ZVTONl1PR1cMBEOzALQnoGoJteuVg7fTY/+GU34lGW
         aJ6Jb25tQuPiZuRxU76lWkQpoeizjjB/17GO0MUJXowKAl471t2e7SFFUnii3Koh7VzQ
         k0kKTnENilmv6chRpfUXiGJCO2ttvMqRUISV+9/c951zQJ0smLHwj8+pngxtL0zUgEW8
         KMbyCSdHiXTn97hS4a0ttqcKXNzTOKm0BESjaOj3seL6pW/IwC/ZoyqwTLhkJv1VXyxW
         nYVw==
X-Gm-Message-State: AOAM531LuD9U4pFzVQqbqkBGThe10MZdv1KWJzn1DqhSPYO/ZuAOqIhw
        WtPUoFPvjuFCGDLx9DCz5W6zoCR0yJd8lg==
X-Google-Smtp-Source: ABdhPJx66+slGS5Qs7Nt+9v0YLJNIrazUPmXvysxRltmh84zmjoesoqrKy5dz7gq35J9FjJAQOQbaA==
X-Received: by 2002:a63:91c3:: with SMTP id l186mr3699400pge.558.1644328718641;
        Tue, 08 Feb 2022 05:58:38 -0800 (PST)
Received: from [192.168.1.116] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id r10sm2423434pgk.74.2022.02.08.05.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 05:58:38 -0800 (PST)
From:   Jens Axboe <axboe@kernel.dk>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
        Jack Wang <jinpu.wang@ionos.com>
Cc:     linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <7f9eccd8b1fce1bac45ac9b01a78cf72f54c0a61.1644266862.git.christophe.jaillet@wanadoo.fr>
References: <7f9eccd8b1fce1bac45ac9b01a78cf72f54c0a61.1644266862.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH v2] block/rnbd: Remove a useless mutex
Message-Id: <164432871743.114004.5542011379839024648.b4-ty@kernel.dk>
Date:   Tue, 08 Feb 2022 06:58:37 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 7 Feb 2022 21:48:19 +0100, Christophe JAILLET wrote:
> According to lib/idr.c,
>    The IDA handles its own locking.  It is safe to call any of the IDA
>    functions without synchronisation in your code.
> 
> so the 'ida_lock' mutex can just be removed.
> It is here only to protect some ida_simple_get()/ida_simple_remove() calls.
> 
> [...]

Applied, thanks!

[1/1] block/rnbd: Remove a useless mutex
      commit: a41cdf83a63122e5c5fb8c8550b812b25a332577

Best regards,
-- 
Jens Axboe


